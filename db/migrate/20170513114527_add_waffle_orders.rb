class AddWaffleOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :order_waffles do |t|
      t.integer :quantity

      t.belongs_to :waffle, index: true
      t.belongs_to :order, index: true
    end
  end
end
