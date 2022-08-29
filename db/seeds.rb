require 'faker'

Faker::UniqueGenerator.clear

until Item.count == 20
  Item.create!(
    title: Faker::Creature::Cat.unique.name,
    description: Faker::Artist.unique.name,
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    image_url: 'https://source.unsplash.com/random/?kitten'
  )
end
