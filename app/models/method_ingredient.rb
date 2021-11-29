class MethodIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :method
end
