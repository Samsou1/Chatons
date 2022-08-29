class Order < ApplicationRecord
  has_many :orderitems
  has_many :items, through: :orderitems
end
