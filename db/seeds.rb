require 'faker'

@tags = []
10.times { |i| @tags << Tag.create(name: Faker::Lorem.word) }


@tags << Tag.create(name: 'yolo')

10.times do |i|
  name = Faker::Name.first_name
  user = User.create(name: name, email: Faker::Internet.email(name), password: Faker::Lorem.word)
  10.times do |j|
    post = Post.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraphs(5))
    post.tags << @tags.sample(3)
    user.posts << post
  end
end
