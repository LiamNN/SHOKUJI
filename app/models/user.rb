class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_goals
  has_many :goals, through: :user_goals
  has_many :recipes
  has_many :scheduled_recipes

  accepts_nested_attributes_for :user_goals
end
