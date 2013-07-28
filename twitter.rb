# encoding: utf-8

require "pry"

require "sinatra"

get "/" do
  pseudo = request.cookies["pseudo"]
  if pseudo
    "Bienvenue sur Twitter #{pseudo}
    <br>
    <form action='/deconnexion' method='post'>
      <input type='submit' value='deconnexion'>
    </form>"
  else
    redirect '/formulaire_de_connexion'
  end
end

get "/formulaire_de_connexion" do
  "Qui êtes-vous ?

  <form action='/connexion' method='post'>
    <input type='text' name='pseudo'>
  </form>"
end

post "/connexion" do
  pseudo = params["pseudo"]
  response.set_cookie('pseudo', pseudo)
  redirect '/'
end

post '/deconnexion' do
  response.delete_cookie('pseudo')
  redirect '/'
end
