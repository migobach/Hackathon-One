Rails.application.routes.draw do
  devise_for :users
  root 'movies#index'

  # resources :movies
  resources :users
  

  resources :movies do 
    resources :comments
  end

  # scope 'users/:user_id', as: 'user' do 
  #   resources :comments
  # end
end
