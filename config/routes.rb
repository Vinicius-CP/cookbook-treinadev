Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'

  resources :recipes, only: %i[index show new create edit update]
  resources :recipe_types, only: %i[show new create]
  resources :recipe_lists, only: %i[index show new create]

  get 'search', to: 'recipes#search'
  get 'myrecipes', to: 'recipes#myrecipes'


  namespace :api do
    namespace :v1 do
      resources :recipes
    end
  end

end
