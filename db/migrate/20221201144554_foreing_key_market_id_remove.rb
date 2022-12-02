class ForeingKeyMarketIdRemove < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :tickets, column: :market_id
  end
end
