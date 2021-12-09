class RecipesController < ApplicationController
   before_action :set_recipe, only: [:show, :destroy, :edit, :update]
   before_action :authenticate_user!, only: :toggle_favorite

  def index
    @recipes = Recipe.all
  end

  def show
    if @recipe.photo.nil?
      @recipe.photo = "https://scontent.fmel14-2.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/190142158_932562257539177_6924772229027277610_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=ed5ff1&efg=eyJpIjoidCJ9&_nc_ohc=Zi227EIvdxAAX8o1PbW&tn=cSAD7cv6Xl1GU-x2&_nc_ht=scontent.fmel14-2.fna&oh=8ef34d5a54662edb89609269a48f9433&oe=61D3EDDE"
    end
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
      redirect_to recipe_path(@recipe)
    else
      render "new"
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

    def toggle_favorite
    @recipe = Recipe.find_by(id: params[:id])
    current_user.favorited?(@recipe) ? current_user.unfavorite(@recipe) : current_user.favorite(@recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :meal_time, :time, :user_id)
  end
end
