class AddBool < ActiveRecord::Migration[5.0]
  def change
    add_column :waffles, :discount, :boolean
  end
end
