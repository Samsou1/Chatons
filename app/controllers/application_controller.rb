class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success, :messages
  
  def clear_cart
    @cart = current_user.cart
    @cart.items = []
    @cart.save
  end

  def destroy_cart
    @cart = current_user.cart
    @cart.destroy
  end

  def show_orders_count
    @orders_count = Order.all.count
  end

  def average_total_of_all_carts
    @average = Cart.all.average(:total)
  end

  def show_all_unordered_carts
    @open_carts = Cart.all
  end
end
