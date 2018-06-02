Rails.application.routes.draw do
  devise_for :users
  root 'movies#index'

  resources :movies do 
    resources :users
  end

  resources :users do 
    resources :comments
  end

  scope 'users/:user_id', as: 'user' do 
    resources :comments
  end
end
