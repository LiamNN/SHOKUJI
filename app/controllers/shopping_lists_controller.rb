class ShoppingListsController < ApplicationController
  before_action :set_schedule_recipe, only: [:create, :new]

  def index
    @scheduled_recipes = current_user.scheduled_recipes
  end

  def new
    @shopping_list = ShoppingList.new
    @scheduled_recipes = current_user.scheduled_recipes
  end

  def create
    @scheduled_recipes = current_user.scheduled_recipes
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.body = @scheduled_recipes.where(scheduled_date: shopping_list_params)
    if @shopping_list.save
      redirect_to shopping_list_path(@shopping_list)
    else
      render "new"
    end
  end

  def show
    @scheduled_recipes = current_user.scheduled_recipes
    @shopping_list = ShoppingList.find(params[:id])
  end

   private

  def set_schedule_recipe
    @scheduled_recipe = current_user.scheduled_recipes
  end

  def shopping_list_params
    params.require(:shopping_list).permit(:user_id, :dates)
  end

end
