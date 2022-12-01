class AddColumnNameToMarket < ActiveRecord::Migration[7.0]
  def change
    add_column :markets, :opening_hours, :boolean
  end
end
