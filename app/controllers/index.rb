# this just displays the homepage

get '/' do
  @tags = Tag.all
  # Look in app/views/index.erb
  erb :index
end
