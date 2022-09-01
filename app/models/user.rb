class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart
  has_one_attached :profile_picture

  after_initialize :set_default_role, if: :new_record?
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  enum role: { user: 0, admin: 1 }

  def set_default_role
    self.role ||= :user
  end
end
