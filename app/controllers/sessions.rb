get '/sessions/login' do
  erb :'users/login'
end

post '/sessions/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = "Bad log in, try again"
    erb :"users/login"
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end
