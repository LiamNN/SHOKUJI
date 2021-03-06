class UserGoal < ApplicationRecord
  belongs_to :user
  belongs_to :goal

  validates :goal, uniqueness: { scope: :user }
end
