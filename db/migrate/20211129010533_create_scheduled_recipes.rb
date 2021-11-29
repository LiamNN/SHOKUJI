class CreateScheduledRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :scheduled_recipes do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :scheduled_date
      t.string :time_of_day

      t.timestamps
    end
  end
end
