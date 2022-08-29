class CheckoutsController < ApplicationController
  def create
    @session = Stripe::Checkout::Session.create(
      {
        mode: 'payment',
        success_url: checkout_success_url,
        cancel_url: checkout_cancel_url,
        payment_method_types: ['card'],
        line_items: [{
          quantity: 1,
          price_data: {
            unit_amount: Item.find(params[:id]).price.to_s.gsub(/\./mi, ''),
            currency: 'eur',
            product_data: {
              name: Item.find(params[:id]).title
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
