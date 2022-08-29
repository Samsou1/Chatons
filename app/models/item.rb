class Item < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :price, presence: true
  has_many :add_items_to_carts
  has_many :carts, through: :add_items_to_carts
end
