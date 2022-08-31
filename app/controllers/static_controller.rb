class StaticController < ApplicationController
  before_action :authenticate_user!, only: %i[profile]
  def contact; end
  def about; end

  def profile
    @user = current_user
    @orders = Order.where(user_id: current_user.id)
    @list_of_order_items = []
    @orders.each do |order|
      @list_of_order_items.push(Orderitem.where(order_id: order.id))
    end
    @items = []
    @list_of_order_items.each_with_index do |order_items, _index|
      ary = []
      order_items.each do |_order_item|
        ary.push(Item.find_by(id: _order_item.item_id))
      end
      @items.push(ary)
    end
  end
end
