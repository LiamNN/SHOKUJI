class ChangeRecipeTimeToString < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :time
    add_column :recipes, :time, :string
  end
end
