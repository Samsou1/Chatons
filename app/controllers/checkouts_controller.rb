class CheckoutsController < ApplicationController
  def create
    @order = Order.create!(order_params)
    @total = @order.total
    @session = Stripe::Checkout::Session.create(
      {
        mode: 'payment',
        success_url: root_url,
        cancel_url: cart_url(current_user.cart),
        payment_method_types: ['card'],
        line_items: [{
          quantity: 1,
          price_data: {
            unit_amount: @total,
            currency: 'eur',
            product_data: {
              name: 'Kitten pictures'
            }
          }
        }]
      }
    )

    respond_to do |format|
      format.js
    end
  end
end
