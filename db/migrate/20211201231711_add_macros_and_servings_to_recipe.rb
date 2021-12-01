class AddMacrosAndServingsToRecipe < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :macros
    add_column :recipes, :macros, :string
    add_column :recipes, :servings, :integer
  end
end
