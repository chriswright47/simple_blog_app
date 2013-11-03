# this just displays the homepage

get '/' do
  @posts = Post.find(:all, order: 'id desc', limit: 10)
  # Look in app/views/index.erb
  erb :index
end

get '/search' do
 ids = search_hits_ids(params[:search])
 @posts = []
 ids.each { |id| @posts << Post.find(id) }
 erb :search_results
end
