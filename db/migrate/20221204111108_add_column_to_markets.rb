class AddColumnToMarkets < ActiveRecord::Migration[7.0]
  def change
    add_column :markets, :price_level, :float
  end
end
