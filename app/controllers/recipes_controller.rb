class RecipesController < ApplicationController
   before_action :set_recipe, only: [:show, :destroy, :edit, :update]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe.id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipes_path(@recipe)
    else
      render "new"
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path(@recipe)
  end

  private

  def set_chef
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :meal_time, :time, :user_id)
  end
end
