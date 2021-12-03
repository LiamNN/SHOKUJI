class UserScheduledRecipesController < ApplicationController

  def create
    @scheduled_recipe = ScheduledRecipe.new(scheduled_recipe_params)
    @scheduled_recipe.user = current_user
    @scheduled_recipe.save
  end

  private

  def scheduled_recipe_params
    params.permit(:scheduled_date, :time_of_day, :recipe_id)
  end
end
