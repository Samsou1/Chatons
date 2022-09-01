class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 5, scale: 2
      t.boolean :paid, default: false
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
