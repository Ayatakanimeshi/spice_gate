Rails.application.routes.draw do
  resources :posts
  resources :users
  root 'tops#top'

  get 'login' => 'user_sessions#new', as: :login
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', as: :logout
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
