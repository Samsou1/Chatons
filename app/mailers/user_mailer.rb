class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = "https://chaton-shop.herokuapp.com/"
    mail(to: @user.email, subject: "Welcome to Chaton-Shop")
  end

  # def email_order(order)

  # end
end
