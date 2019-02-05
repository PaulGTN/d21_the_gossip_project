#(rand(X.first.id..X.last.id))

require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
GossipTag.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Like.destroy_all

10.times do
  city = City.create!(name: Faker::Address.unique.city, zip_code: Faker::Address.unique.zip_code)
end 

10.times do 
  user = User.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, description: Faker::Movie.quote, email: Faker::Internet.email, age: Faker::Number.number(2), city_id: (rand(City.first.id..City.last.id)))
end

20.times do 
  gossip = Gossip.create!(title: Faker::BojackHorseman.character, content: Faker::BojackHorseman.quote, user_id: (rand(User.first.id..User.last.id)))
end 

10.times do
  tag = Tag.create!(title: Faker::Color.color_name)
end

40.times do
  gossip_tag = GossipTag.create!(gossip_id: (rand(Gossip.first.id..Gossip.last.id)), tag_id: (rand(Tag.first.id..Tag.last.id)))
end

10.times do
  private_message = PrivateMessage.create!(content: Faker::BojackHorseman.tongue_twister, sender_id: (rand(User.first.id..User.last.id)), recipient_id: (rand(User.first.id..User.last.id)))
end

20.times do 
  comment = Comment.create!(content: Faker::FamilyGuy.quote, user_id: (rand(User.first.id..User.last.id)), gossip_id: (rand(Gossip.first.id..Gossip.last.id)))
end

20.times do
  like = Like.create!(user_id: (rand(User.first.id..User.last.id)), gossip_id: (rand(Gossip.first.id..Gossip.last.id)), comment_id: (rand(Comment.first.id..Comment.last.id)))
end

