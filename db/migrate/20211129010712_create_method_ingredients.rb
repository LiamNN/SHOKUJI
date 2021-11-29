class CreateMethodIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :method_ingredients do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :recipe_method, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
