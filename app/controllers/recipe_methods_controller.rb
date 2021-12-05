class RecipeMethodsController < ApplicationController
  before_action :set_recipe, only: [:show, :index, :new, :create, :edit, :update]
  before_action :set_method, only: [:edit, :update]


  def index
    @recipe_methods = RecipeMethod.where(recipe_id: params[:recipe_id])
  end

  def show
  end

  def new
    @recipe_method = RecipeMethod.new
  end

  def edit
  end

  def update
    @recipe_method.update(recipe_params)
    redirect_to recipe_recipe_methods_path(recipe_id: params[:recipe_id])
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

  def set_method
    @recipe_method = RecipeMethod.find(params[:id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_params
    params.require(:recipe_method).permit(:instructions, :recipe_id)
  end

end
