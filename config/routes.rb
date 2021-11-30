Rails.application.routes.draw do
  get 'profiles/:id', to: 'profiles#show', as: :profile
  devise_for :users

  root to: 'pages#home'

  resources :goals, only: [:index, :show]

  resources :recipes do
    resources :recipe_methods, only: [:index, :new, :create, :destroy, :edit, :update]
    resources :reviews, only: [:index, :show, :new, :create]
    resources :scheduled_recipes, only: [:index, :new, :create]
  end

  post 'shopping_list', to: 'shopping_list#create'
  get 'shopping_list', to: 'shopping_list#new'

end
