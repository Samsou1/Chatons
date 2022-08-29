class Item < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :price, presence: true
end
