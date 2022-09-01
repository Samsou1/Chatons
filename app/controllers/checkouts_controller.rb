class CheckoutsController < ApplicationController
  def create
    total = 0
    @order = Order.create(user_id: current_user.id, total: total)
    @user = current_user
    @cart = @user.cart
    @items = current_user.cart.items

    @items.each do |item|
      Orderitem.create!(order_id: @order.id, item_id: item.id)
      total += item.price
    end

    @order.update(total: total)

    @session = Stripe::Checkout::Session.create(
      {
        mode: 'payment',
        success_url: root_url,
        cancel_url: cart_url(current_user.cart),
        payment_method_types: ['card'],
        line_items: [{
          quantity: 1,
          price_data: {
            unit_amount: (total * 100).to_i,
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
