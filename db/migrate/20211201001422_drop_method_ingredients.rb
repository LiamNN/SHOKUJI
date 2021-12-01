class DropMethodIngredients < ActiveRecord::Migration[6.1]
  def change
    drop_table :method_ingredients
  end
end
