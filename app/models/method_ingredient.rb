class MethodIngredient < ApplicationRecord
  belongs_to :ingredient, dependent: :destroy
  belongs_to :method
end
