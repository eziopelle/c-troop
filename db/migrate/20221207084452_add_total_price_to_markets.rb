class AddTotalPriceToMarkets < ActiveRecord::Migration[7.0]
  def change
    add_column :markets, :total_price, :float
  end
end
