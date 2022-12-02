class AddReferenceMarketIdToTicket < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :market, foreign_key: true
  end
end
