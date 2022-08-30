require 'faker'

Faker::UniqueGenerator.clear

User.create(email: 'email@yopmail.com', password: 'adminpassword')

until User.count == 10
  User.create!(
    email: Faker::Internet.email(domain: 'yopmail'),
    password: Faker::Internet.password(min_length: 8)
  )
end

until Item.count == 20
  Item.create!(
    title: Faker::Creature::Cat.unique.name,
    description: Faker::Artist.unique.name,
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    image_url: 'https://source.unsplash.com/random/?kitten'
  )
end
