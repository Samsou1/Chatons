class StaticController < ApplicationController
  before_action :authenticate_user!, only: %i[profile]
  def contact; end
  def about; end

  def profile
    @user = current_user
    @orders = Order.where(user_id: current_user.id)
    @oderitems = []
    @orders.each do |order|
      orderitems = Odertitems.where(order_id: order.id)
      @orderitems.push(orderitems)
    end
  end
end
