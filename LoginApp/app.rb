require "sinatra"
require "sinatra/reloader" if development?
require "pry"

require_relative './lib/Users'

enable(:sessions)

# extra: que user sea un modelo en lib folder
#@@users = [{username: "wolas", password: "B5%khjsd"}]

get '/' do
  erb(:index)
end

post "/log_in" do
  # comprobar que username y password machean a un usuario
  username = params[:user]
  password = params[:password]
  if Users.check_user?(username,password)
    session[:logged_in] = true
    redirect('/profile')
  else
    @message = "Usuario y/o contraseña inválidos"
    session[:message] = @message
    redirect('/')
  end
end

post "/logout" do
  session.clear
  redirect('/')
end

get '/register' do
  erb(:register)
end 

post '/register' do
  # añadir un usuario
  # extras: 
      # no permitir username o password en blanco
      # no permitir username que ya este registrados
  username = params[:user]
  password = params[:password]
  if !Users.user_exits?(username)
    Users.add_user(username,password)
    @message = "Registro completado. ahora mete datos, venga. "
    session[:message] = @message
    redirect("/")
  else
    @message = "Llegas tarde con ese usuario!!"
    session[:message] = @message
    redirect("/register")
  end
end

get '/profile' do
  # solo puedes llegar si estas registrado
  if session[:logged_in]
    erb(:profile)
  else
    @message = "Eres un trampas"
    session[:message] = @message
    redirect('/')
  end
end