class Recipe < ApplicationRecord
  belongs_to :user

  has many :methods
  has many :ingredients, through: :method_ingredients
end
