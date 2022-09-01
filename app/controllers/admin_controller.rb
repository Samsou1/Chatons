class AdminController < ApplicationController
  def index; end

  def users
    @users = User.all
  end

  def items
    @items = Item.all
  end

  def orders
    @orders = Order.all
  end
end
