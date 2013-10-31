# have a route to show all posts with a given tag

get '/tag/:tag_name' do
  @tag = Tag.find_by_name(params[:tag_name])
  @posts = @tag.posts
  erb :tag  
end
