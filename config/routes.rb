Rails.application.routes.draw do
  get 'shopping_lists/create'
  get 'shopping_lists/new'
  devise_for :users

  root to: 'pages#home'

  resources :goals, only: [:index, :show]

  resources :recipes do
    resources :recipe_methods, only: [:index, :new, :create, :destroy]
    resources :reviews, only: [:index, :show, :new, :create]
    resources :scheduled_recipes, only: [:index, :new, :create]
  end

  post 'shopping_list', to: 'shopping_list#create'
  get 'shopping_list', to: 'shopping_list#new'

end
