class CartItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  def create
    @cartitem = Cartitem.new(params)

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
    puts '$' * 20
    puts 'trying to destroy cartitem'
    puts params
    puts @cartitem
    puts '$' * 20
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
