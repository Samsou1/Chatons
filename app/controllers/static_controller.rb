class StaticController < ApplicationController
  before_action :authenticate_user!, only: %i[profile cart]
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

  def cart
    unless user_signed_in?
      redirect_to root_path
      return
    end
    if Cart.where(user_id: current_user.id).count == 0
      redirect_to root_path
    else
      @cart = Cart.find_by(user_id: current_user.id)
      @cartitems = Cartitem.where(cart_id: @cart.id)
      @items = {}
      @total_price = 0
      @cartitems.each do |cartitem|
        item = Item.find(cartitem.item_id)
        if @items.include?(item)
          @items[item] += 1
        else
          @items[item] = 1
        end
        @total_price += item.price
      end
    end
  end
end
