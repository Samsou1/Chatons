class CreateCartitems < ActiveRecord::Migration[7.0]
  def change
    create_table :cartitems do |t|
      t.belongs_to :item, index: true
      t.belongs_to :cart, index: true
      t.timestamps
    end
  end
end
