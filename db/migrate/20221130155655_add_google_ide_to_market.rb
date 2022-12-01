class AddGoogleIdeToMarket < ActiveRecord::Migration[7.0]
  def change
    add_column :markets, :google_id, :string
  end
end
