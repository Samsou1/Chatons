class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :title, length: { minimum: 3 }
end
