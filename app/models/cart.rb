class Cart < ApplicationRecord
  has_many :add_items_to_carts
  has_many :items, through: :add_items_to_carts
end
