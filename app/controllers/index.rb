get '/' do
  # session.clear
  erb :index
end

post '/login' do
  erb :_login, :layout => false
end

post '/signup' do
  erb :_signup, :layout => false
end

post '/signup_user' do
  @user = User.create(params)
  @cookbook = Cookbook.create(user_id: @user.id)
  session[:id] = @user.id
  redirect "/users/#{@user.username}"
end

post '/login_user' do
  @user = User.find_by_username(params[:username])
  if @user.password = params[:password]
    session[:id] = @user.id
    redirect "/users/#{@user.username}"
  else
    redirect "/"
  end
end

post '/logout' do
  session.clear
  redirect '/'
end