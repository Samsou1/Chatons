class CreateAddItemsToCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :add_items_to_carts do |t|
      t.belongs_to :item, index: true
      t.belongs_to :cart, index: true
      t.timestamps
    end
  end
end
