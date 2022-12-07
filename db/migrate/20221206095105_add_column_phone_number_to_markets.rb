class AddColumnPhoneNumberToMarkets < ActiveRecord::Migration[7.0]
  def change
    add_column :markets, :phone_number, :string
  end
end
