class ShoppingListsController < ApplicationController

  def index
    @shopping_list = ShoppingList.all
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

   private

  def shopping_list_params
    params.require(:shopping_list).permit(:recipe_id, :user_id, :scheduled_date, :time_of_day)
  end

end
