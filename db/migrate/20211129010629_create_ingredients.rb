class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :macros
      t.string :photo

      t.timestamps
    end
  end
end
