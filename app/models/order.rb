class Order < ApplicationRecord
  has_many :orderitems
  has_many :items, through: :orderitems

  after_create :order_send

  def order_send
    UserMailer.email_order(self).deliver_now
  end
end
