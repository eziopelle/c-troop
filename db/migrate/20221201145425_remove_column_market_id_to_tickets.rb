class RemoveColumnMarketIdToTickets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tickets, :market_id
  end
end
