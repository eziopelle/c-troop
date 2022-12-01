class ChangeOpeningHourType < ActiveRecord::Migration[7.0]
  def change
    change_column :markets, :opening_hours, :string
  end
end
