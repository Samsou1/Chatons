class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:user_id)
  end
end
