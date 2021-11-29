Rails.application.routes.draw do
  get 'goals/index'
  get 'goals/show'
  get 'ingredients/index'
  get 'ingredients/show'
  get 'methods/index'
  get 'methods/show'
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/destroy'
  get 'reviews/show'
  get 'recipes/show'
  get 'recipes/index'
  get 'recipes/new'
  get 'recipes/create'
  get 'recipes/destroy'
  get 'recipes/edit'
  get 'recipes/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
