class Item < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :price, presence: true

  has_many :cartitems
  has_many :carts, through: :cartitems
  has_many :orderitems
  has_many :orders, through: :orderitems

  has_one_attached :image
end
