class AddQtyToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :quantity, :integer
  end
end
