class RemoveColumnToMarkets < ActiveRecord::Migration[7.0]
  def change
    remove_column :markets, :pourcentage_price, :float
  end
end
