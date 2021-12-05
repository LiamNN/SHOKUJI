class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :ask_for_goal, if: :user_has_no_goals

  protected

  # def ask_for_goal
  #   redirect_to new_user_goal_path
  # end

  # def user_has_no_goals
  #   return if devise_controller?

  #   user_signed_in? && current_user.goals.present?
  # end

  def configure_permitted_parameters
    keys = [:email, :password, :full_name, :address]
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(keys)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(keys)}
  end
end
