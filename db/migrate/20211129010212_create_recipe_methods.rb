class CreateRecipeMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_methods do |t|
      t.references :recipe, null: false, foreign_key: true
      t.text :instructions

      t.timestamps
    end
  end
end
