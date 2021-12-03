class ScheduledRecipesController < ApplicationController
  before_action :set_recipe, only: [:create, :new]
  # before_action: :set_schedule_recipe, only: [:create, :new]

  def index
    @scheduled_recipes = ScheduledRecipe.all
    @favorites = current_user.favorited_by_type('Recipe')
  end

  def create
    @scheduled_recipe = ScheduledRecipe.new(scheduled_recipe_params)
    @scheduled_recipe.user = current_user
    @scheduled_recipe.recipe = @recipe
    @scheduled_recipe.save
    respond_to do |format|
      format.html { redirect_to recipe_scheduled_recipes_path }
      format.json { render json: @scheduled_recipe }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_schedule_recipe
    @scheduled_recipe = ScheduledRecipe.find(params[:id])
  end

  def scheduled_recipe_params
    params.require(:scheduled_recipe).permit(:scheduled_date, :time_of_day)
  end
end
