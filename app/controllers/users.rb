get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/register' do
  erb :'users/register'
end

post '/users/register' do
  @user = User.new(params[:user])
  if @user.save
    session["user_id"] = @user.id
    redirect "/sessions/login"
  else
    @errors = @user.errors.full_messages
    erb :"users/register"
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end

