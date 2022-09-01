class Order < ApplicationRecord
  validates :total, presence: true
  has_many :orderitems
  has_many :items, through: :orderitems
  belongs_to :user

  after_create :order_send

  def order_send
    UserMailer.email_order(self).deliver_now
    AdminMailer.order_paid(self).deliver_now
  end
end
