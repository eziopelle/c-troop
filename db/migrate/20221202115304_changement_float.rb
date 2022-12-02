class ChangementFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :mean_price, :float
    change_column :market_products, :price, :float
  end
end
