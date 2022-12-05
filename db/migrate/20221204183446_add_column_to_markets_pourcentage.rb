class AddColumnToMarketsPourcentage < ActiveRecord::Migration[7.0]
  def change
    add_column :markets, :pourcentage_price, :float
  end
end
