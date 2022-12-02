class ChangeTotalPriceToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :tickets, :total_price, :float
  end
end
