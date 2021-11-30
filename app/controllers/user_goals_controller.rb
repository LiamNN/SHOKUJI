class UserGoalsController < ApplicationController
  def new
    @user = current_user
  end

  def create
    if current_user.update(user_goals_params)
      redirect_to recipes_path
    else
      render "new"
    end
  end

private

  def user_goals_params
    params.require(:user).permit(goal_ids: [])
  end
end


put [1,2,3,4]
