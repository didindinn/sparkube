Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create]
    resource :session, only: [:create, :destroy]
    resources :videos, only: [:index, :show, :create, :update, :destroy] do
      resources :likes, only: [:create]    
      resources :dislikes, only: [:create]
    end
    resources :likes, only: [:destroy]
    resources :dislikes, only: [:destroy]
  end
  
end
