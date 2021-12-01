class AddRecipeIdToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_reference :ingredients, :recipe, index: true
  end
end
