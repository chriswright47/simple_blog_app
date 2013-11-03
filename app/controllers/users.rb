get '/user/:user_id' do
  @user = User.find(params[:user_id])
  @posts = @user.posts
  erb :user_page
end

get '/login' do
  erb :login
end

get '/create_user' do
  erb :create_user
end

post '/login' do
  user = User.find_by_email(params[:email]) 
  if user && user.password == params[:password]
    session[:user_id] = user.id
    session[:user_email] = user.email
    session[:user_name] = user.name
    session[:failed_login] = false
    session[:user] = user
    redirect '/'
  else
    session[:failed_login] = true
    redirect '/login'
  end
end

post '/create_user' do
  if !User.find_by_email(params[:email]) # => means email does not exist
    user = User.create!(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    session[:user_email] = user.email
    session[:user_name] = user.name
    session[:user] = user
    redirect '/'
  else 
    session[:email_taken] = true
    redirect '/create_user'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end


