class UserMailer < ApplicationMailer
  default from: 'chaton_shop@yopmail.com'

  def welcome_email(user)
    @user = user
    @url = "https://kittenfest.herokuapp.com/"
    mail(to: @user.email, subject: "Welcome to Chaton-Shop")
  end

  # def email_order(order)

  # end
end
