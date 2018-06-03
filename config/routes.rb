Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root 'movies#index'

  # resources :movies do 
  resources :users

  resources :movies do 
    resources :comments
  end

  # scope 'users/:user_id', as: 'user' do 
  #   resources :comments
  # end
end
