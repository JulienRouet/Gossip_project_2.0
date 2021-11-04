require 'faker'

City.destroy_all
puts 'no mo cities'
Comment.destroy_all
puts 'adieu les rageux'
Gossip.destroy_all
puts 'plus aucuns ragots'
Like.destroy_all
puts 'plus de pouces bleu'
PrivateMessage.destroy_all
puts 'plus de msg privés'
Receiver.destroy_all
puts 'plus de reception'
SubComment.destroy_all
puts 'plus de souscomment'
Tag.destroy_all
puts 'on repeint les tags'
TagToGossip.destroy_all
puts 'ici aussi... '
User.destroy_all
puts 'nadié! que c\'est triste'
20.times do |n|
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip)
  puts "#{n} villes crées"
end

User.create(
  first_name: 'arnaudnimous',
  last_name: 'suomynona',
  description: 'who knows ?',
  email: 'ano@nym.ous',
  age: 69,
  city: City.all.sample
)

5.times do |n|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 20),
    email: Faker::Internet.email,
    age: rand(15..90),
    city: City.order('RANDOM()').first
  )
  puts "#{n} users crées"
end

20.times do |n|
  Tag.create(title: Faker::Lorem.word)
  puts "#{n} tag crées"
end

10.times do |n|
  Gossip.create(
    title: Faker::Lorem.sentence(word_count: 2),
    content: Faker::Lorem.sentence(word_count: 15),
    user: User.order('RANDOM()').first
  )
  puts "#{n} gossips crées"
end

30.times do |n|
  TagToGossip.create(gossip: Gossip.order('RANDOM()').first, tag: Tag.order('RANDOM()').first)
  puts "#{n} tags assignés a un gossip"
end

5.times do |n|
  PrivateMessage.create(content: Faker::Lorem.sentence(word_count: 50), sender: User.order('RANDOM()').first)
  puts "#{n} messages privés crées"
end

15.times do |n|
  Receiver.create(user: User.order('RANDOM()').first, private_message: PrivateMessage.order('RANDOM()').first)
  puts "#{n} receuveurs crées"
end

20.times do |n|
  Comment.create(
    content: Faker::TvShows::MichaelScott.quote,
    gossip: Gossip.order('RANDOM()').first,
    user: User.order('RANDOM()').first
  )
  puts "#{n} commentaires crées"
end

30.times do |n|
  SubComment.create(
    content: Faker::Lorem.sentence(word_count: 50),
    comment: Comment.order('RANDOM()').first,
    user: User.order('RANDOM()').first
  )
  puts "#{n} sous commentaires"
end

50.times do |n|
  dice = rand(1..2)
  if dice == 1
    Like.create(
      user: User.order('RANDOM()').first,
      gossip: Gossip.order('RANDOM()').first,
      )
    puts "#{n} like attribués"
  else
    Like.create(
      user: User.order('RANDOM()').first,
      comment: Comment.order('RANDOM()').first
    )
    puts "#{n} like attribués"
  end
end