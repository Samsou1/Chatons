class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @cart_count = Cart.where(user_id: current_user.id).count
    @cart = if @cart_count == 0
              Cart.create(user_id: current_user.id)
            else
              Cart.where(user_id: current_user.id)[0]
            end
    @cartitem = Cartitem.new(cart_id: @cart.id, item_id: params[:item])
    respond_to do |_format|
      if @cartitem.save
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js {}
        end
        flash[:notice] = 'Item added to cart'
      else
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js {}
        end
        flash[:notice] = 'Please try again'
      end
    end
  end

  def destroy
    @cartitem = Cartitem.find_by_id(params[:id])
    if @cartitem.destroy
      respond_to do |format|
        format.html { redirect_to cart_path(@cartitem.cart_id) }
        format.js {}
      end
      flash[:notice] = 'Item removed from cart'
    else
      respond_to do |format|
        format.html { redirect_to cart_path(@cartitem.cart_id) }
        format.js {}
      end
      flash[:notice] = 'Please try again'
    end
  end
end
