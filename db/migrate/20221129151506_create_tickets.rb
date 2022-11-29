class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.date :date
      t.decimal :total_price
      t.references :user, null: false, foreign_key: true
      t.references :market, null: false, foreign_key: true

      t.timestamps
    end
  end
end
