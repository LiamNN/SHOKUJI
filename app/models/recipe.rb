class Recipe < ApplicationRecord
  belongs_to :user
  
  has many :methods
  has many :ingredients though: :method_ingredients
end
