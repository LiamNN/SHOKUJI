class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :meal_time
      t.references :user, null: false, foreign_key: true
      t.integer :time

      t.timestamps
    end
  end
end
