class Cart < ApplicationRecord
  has_many :cartitems
  has_many :items, through: :cartitems
  belongs_to :user
end
