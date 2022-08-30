class AddPaymentDetailsToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :is_paid, :boolean, default: false
  end
end
