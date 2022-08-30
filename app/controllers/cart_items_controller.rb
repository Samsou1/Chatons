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
    @cartitem.destroy
  end
end
