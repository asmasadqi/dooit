class ChangePricePerDayToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :activities, :price_per_day, :integer
  end
end
