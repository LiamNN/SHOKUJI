class RecipeMethodsController < ApplicationController
  before_action :set_recipe, only: [:show, :index, :new, :create]

  def index
    @recipe_methods = RecipeMethod.where(recipe_id: params[:recipe_id])
  end

  def show
  end

  def new
    @recipe_method = RecipeMethod.new
  end

  def create
    @recipe_method = RecipeMethod.new(recipe_params)
    @recipe_method.recipe_id = params[:recipe_id]
    @recipe.user = current_user
    if @recipe_method.save
      redirect_to recipe_path(@recipe)
    else
      render "new"
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_params
    params.require(:recipe_method).permit(:instructions, :recipe_id)
  end

end
