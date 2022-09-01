class CheckoutsController < ApplicationController
  def create
    @total = 0
    @cart = current_user.cart
    @items = @cart.items

    @items.each do |item|
      @total += item.price
    end

    @order = Order.create(user_id: current_user.id)
    @order.total = @total

    @session = Stripe::Checkout::Session.create(
      {
        mode: 'payment',
        success_url: root_url,
        cancel_url: cart_url(current_user.cart),
        payment_method_types: ['card'],
        line_items: [{
          quantity: 1,
          price_data: {
            unit_amount: 2000,
            currency: 'eur',
            product_data: {
              name: 'Kitten pictures'
            }
          }
        }]
      }
    )

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_url(@order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
end
