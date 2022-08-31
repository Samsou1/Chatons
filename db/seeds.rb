require 'faker'

Faker::UniqueGenerator.clear

User.create(email: 'admin@yopmail.com', password: 'adminpassword', first_name: 'Super', last_name: 'Admin',
            zip_code: '75000', address: '1 Rue du chat', admin: true)

until User.count == 10
  User.create!(
    email: Faker::Internet.email(domain: 'yopmail'),
    password: Faker::Internet.password(min_length: 8)
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
end
