class DefaultBool < ActiveRecord::Migration[5.0]
  def change
 change_column :waffles, :discount, :boolean, :default => false
  end
end
