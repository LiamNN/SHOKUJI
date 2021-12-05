class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.goals.present?
      recipes_path
    else
      new_user_goal_path
    end

  end
end
