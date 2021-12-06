class ShoppingListsController < ApplicationController
  before_action :set_recipe, only: [:create, :new]
  before_action :set_schedule_recipe, only: [:create, :new]

  def index
    @scheduled_recipes = current_user.scheduled_recipes
  end

  def new
    @shopping_lists = ShoppingList.new
  end

  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.user = current_user
    if @shopping_list.save
      redirect_to shopping_lists_path
    else
      render "new"
    end
  end

   private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_schedule_recipe
    @scheduled_recipe = ScheduledRecipe.find(params[:id])
  end

  def shopping_list_params
    params.require(:shopping_list).permit(:recipe_id, :user_id, :scheduled_date, :time_of_day)
  end

end
