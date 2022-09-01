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

    redirect_to @session.url, allow_other_host: true
  rescue Stripe::InvalidRequestError => e
    redirect_to cart_url(current_user.cart), alert: e.message
  end
end
