class CreateMarketProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :market_products do |t|
      t.decimal :price
      t.references :market, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
