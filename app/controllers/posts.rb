# Have routes for:
#   show all posts
#   show me a particular post
#   create a new post
#   edit an existing post
#   delete an existing post

get '/posts' do
  @posts = Post.order('updated_at desc')
  erb :posts
end

get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  @user_name = User.find(@post.user_id).name
  @tags = @post.tags
  erb :post_page
end

get '/create_post' do
  @tags = Tag.all
  erb :create_post
end

post '/create_post' do
  p params
  post = Post.create!(  title: params[:title], body: params[:body])
  params.each do |tag, status|
    post.tags << Tag.find_by_name(tag) if status == 'true'
  end
  User.find(session[:user_id]).posts << post
  redirect "/user/#{session[:user_id]}"
end

get '/edit_post/:post_id' do
  @post = Post.find(params[:post_id])
  @tags = Tag.all
  erb :edit_post
end

post '/edit_post/:post_id' do
  post = Post.find(params[:post_id])
  post.posts_tags.each do |tagging|
    tagging.destroy
  end
  post.update_attributes( title: params[:title],
    body: params[:body], )
  params.each do |tag, status|
    post.tags << Tag.find_by_name(tag) if status == 'true'
  end
  redirect "/posts/#{params[:post_id]}"
end

get '/posts/:post_id/delete' do
  Post.find(params[:post_id]).destroy
  redirect '/'
end

