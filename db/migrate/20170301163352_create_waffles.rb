class CreateWaffles < ActiveRecord::Migration[5.0]
  def change
    create_table :waffles do |t|
      t.string :nazwa
      t.float :cena

      t.timestamps
    end
  end
end
