class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :time, presence: true


  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :recipe_methods, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :scheduled_recipes, dependent: :destroy

end
