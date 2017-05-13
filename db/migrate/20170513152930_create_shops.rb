class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :nazwa
      t.string :lokalizacja

      t.timestamps
    end

    add_reference :orders, :shop, index: true
  end
end
