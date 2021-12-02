class UserGoalsController < ApplicationController
  def new
    @user = current_user
    @categories = { "Weight Loss" => "fas fa-weight", "Gain Muscle" => "fas fa-dumbbell", "Health" => "fas fa-heartbeat", "Weight Gain" => "fas fa-cookie-bite", "Medical" => "fas fa-stethoscope", "Environmental" => "fab fa-envira" }
  end

  def create
    goals = params[:user][:goals]
    goals.each do |g|
      found_goal = Goal.find_or_create_by(name: g)
      UserGoal.create(goal: found_goal, user: current_user)
    end
    redirect_to recipes_path
  end

private

  def user_goals_params
    params.require(:user).permit(goal_ids: [])
  end
end
