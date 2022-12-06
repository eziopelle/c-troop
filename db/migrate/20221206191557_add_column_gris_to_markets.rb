class AddColumnGrisToMarkets < ActiveRecord::Migration[7.0]
  def change
    add_column :markets, :ping_gris, :boolean
  end
end
