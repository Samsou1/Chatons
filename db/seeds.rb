require 'faker'
require 'unsplash'

Faker::UniqueGenerator.clear

kittens = Unsplash::Photo.search('kitten', 1, 20)

20.times do |i|
  Item.create!(
    title: Faker::Creature::Cat.unique.name,
    description: kittens[i].alt_description,
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    image_url: kittens[i].urls.regular
  )
end
