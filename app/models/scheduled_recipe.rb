class ScheduledRecipe < ApplicationRecord
  validates :time_of_day, presence: true
  validates :scheduled_date, presence: true

  belongs_to :recipe
  belongs_to :user
  has_many :ingredients, through: :recipe
end
