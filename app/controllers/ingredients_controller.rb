class IngredientsController < ApplicationController
  before_action :set_recipe, only: [:show, :index]

  def index
    @ingredients = Ingredient.where(recipe_id: params[:recipe_id])
  end

  def show
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

end
