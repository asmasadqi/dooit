class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :localization
      t.float :price_per_day
      t.integer :max_persons
      t.float :average_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
