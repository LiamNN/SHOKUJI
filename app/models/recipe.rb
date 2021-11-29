class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :meal_time, presence: true
  validates :time, presence: true


  belongs_to :user

  has_many :reviews
  has_many :methods
  has_many :ingredients, through: :method_ingredients
end
