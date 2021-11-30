class Recipe < ApplicationRecord
  belongs_to :user

  has_many :methods, dependent: :destroy
  has_many :ingredients, through: :method_ingredients
end
