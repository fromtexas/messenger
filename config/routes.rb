Rails.application.routes.draw do
  root 'home#index' 
  get 'search' => 'home#search'
 resources :home
 resources :lists
  devise_for :users

    resources :conversations, only: [:create] do
    	resources :messages, only: [:create]
    member do
      post :close
      post :toggleDownscale
      post :toggleUpscale
    end
  end
end
