class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :meal_time, presence: true
  validates :time, presence: true


  belongs_to :user

  has_many :reviews
  has_many :recipe_methods
  has_many :method_ingredients, through: :recipe_methods
  has_many :ingredients, through: :method_ingredients
  has_many :scheduled_recipes, dependent: :destroy

end
