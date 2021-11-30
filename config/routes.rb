Rails.application.routes.draw do
  get 'profiles/:id', to: 'profiles#show', as: :profile 
  devise_for :users

  root to: 'pages#home'

  resources :goals, only: [:index, :show]

  resources :recipes do
    resources :reviews, only: [:index, :show, :new, :create]
  end

  resources :methods_ingredients, only: [:index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
