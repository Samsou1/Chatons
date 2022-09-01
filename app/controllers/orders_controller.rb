class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.total = 0
  end

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @user = current_user
    @cart = @user.cart
    @items = current_user.cart.items

    @items.each do |item|
      Orderitem.create!(order_id: @order.id, item_id: item.id)
      @order.total += item.price
    end

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
    params.require(:order).permit(:user_id, :total)
  end
end
