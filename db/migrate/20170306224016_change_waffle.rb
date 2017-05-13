class ChangeWaffle < ActiveRecord::Migration[5.0]
  def change
    rename_column :waffles, :nazwa, :name
    rename_column :waffles, :cena, :price
  end
end
