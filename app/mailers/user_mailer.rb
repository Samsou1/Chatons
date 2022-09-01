class UserMailer < ApplicationMailer
  default from: 'chaton_shop@yopmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://kittenfest.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to Kittenfest')
  end

  def email_order(order)
    @order = order
    @user = @order.user
    @url = 'https://kittenfest.herokuapp.com/'
    @items = @order.items
    mail(to: @user.email, subject: 'Order on Kittenfest')
  end
end
