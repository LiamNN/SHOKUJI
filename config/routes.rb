Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, controllers: { registrations: "registrations" }


  resources :goals, only: [:index, :show]
  resources :user_goals, only: [:new, :create]
  resources :recipes do
    member do
      post 'toggle_favorite', to: "recipes#toggle_favorite"
    end

    resources :recipe_methods, only: [:index, :new, :create, :destroy, :edit, :update]
    resources :reviews, only: [:index, :show, :new, :create]
    resources :scheduled_recipes, only: [:new, :create, :destroy]
    resources :ingredients, only: [:index, :show]
  end

  resources :scheduled_recipes, only: [:index]

  get 'profiles/:id', to: 'profiles#show', as: :profile
  post 'shopping_list', to: 'shopping_list#create'
  get 'shopping_list', to: 'shopping_list#new'

end
