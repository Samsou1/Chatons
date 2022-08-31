class CreateOrderitems < ActiveRecord::Migration[7.0]
  def change
    create_table :orderitems do |t|
      t.belongs_to :item, index: true, foreign_key: true
      t.belongs_to :order, index: true, foreign_key: true

      t.timestamps
    end
  end
end
