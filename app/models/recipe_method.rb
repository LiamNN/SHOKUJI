class RecipeMethod < ApplicationRecord
  belongs_to :recipe

  has_many :method_ingredients, dependent: :destroy
  has_many :ingredients, through: :method_ingredients
end
