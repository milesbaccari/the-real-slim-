require 'sinatra' 
require 'sinatra/activerecord'

configure(:development){set :database, {adapter: "sqlite3", database: "sessionsDB.sqlite3"}
set :sessions, true

require './models'

def current_user
  if session[:user_id]
    if User.find(session[:user_id]).blank? then redirect "/logout" else @current_user = User.find(session[:user_id]) end
  else
    redirect "/sign_in"
  end
end

get '/' do
  current_user
erb :sign_in
end

get '/login' do
  erb :sign_in
end

get '/signup' do
  erb :signup, :layout => :layout_signup
end

post '/sign_up_process' do
  User.create(email: params[:email], password: params[:password])
  redirect "/"
end

get '/cool' do
  current_user
    erb :cool
end

get '/logout' do
  session.clear
  redirect "/"
end

post '/sign_in_process' do
  @user = User.find_by_email params[:email]
    if !@user.blank?
      if params[:password] == @user.password
        session[:username] = @user.id
      end
   end
    redirect "/"
end


