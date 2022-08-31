class Cartitem < ApplicationRecord
  validates :cart_id, uniqueness: { scope: :item_id }
  belongs_to :item
  belongs_to :cart
end
