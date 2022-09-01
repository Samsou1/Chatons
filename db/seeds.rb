require 'faker'
require 'uri'

Faker::UniqueGenerator.clear

User.create(email: 'kittenfest-admin@yopmail.com', password: 'adminpassword', role: User.roles[:admin])


until User.count == 10
  User.create!(
    email: Faker::Internet.unique.email(domain: 'yopmail.com'),
    password: Faker::Internet.password(min_length: 8),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code,
    city: Faker::Address.city
  )
end

kittens = Unsplash::Photo.search('kitten', 1, 20)

20.times do |i|
  Item.create!(
    title: Faker::Creature::Cat.unique.name,
    description: kittens[i].alt_description,
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    image_url: kittens[i].urls.regular
  )
  file = URI.open(kittens[i].urls.regular)
  Item.last.image.attach(io: file, filename: 'kitten-image.jpg')
end
