helpers do

  # returns an array of ids as integers
  def search_hits_ids(search)
    search = search.downcase
    #search is a string
    posts = Post.where('title like ? OR title like ?', "%#{search.capitalize}%", "%#{search}%").order('updated_at desc')

    ids = []
    posts.each do |post|
      ids << post.id
    end
    ids
  end

  def page_count
    Post.all.count / 15 + 1
  end



end
