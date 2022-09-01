class AdminMailer < ApplicationMailer
  default from: 'chaton_shop@yopmail.com'
  def order_paid(order)
    @user = order.user
    @admins = User.where(role: 'admin')
    @admins.each do |admin|
      mail(to: admin.email, subject: 'Order on Kittenfest')
    end
  end
end
