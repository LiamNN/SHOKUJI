class ScheduleRecipesController < ApplicationController
  def index
    @scheduled_recipes = ScheduledRecipe.all
  end

  def new
    @scheduled_recipe = ScheduledRecipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      # redirect_to recipes_path(@recipe)
    else
      render "new"
    end
  end

  private

  def recipe_params
    params.require(:scheduled_recipes).permit(:recipe_id, :user_id, :scheduled_date, :time_of_day)
  end
end
