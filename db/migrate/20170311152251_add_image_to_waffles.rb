class AddImageToWaffles < ActiveRecord::Migration[5.0]
  def change
    add_column :waffles, :image, :string
  end
end
