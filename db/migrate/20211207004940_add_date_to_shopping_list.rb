class AddDateToShoppingList < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_lists, :dates, :date
  end
end
