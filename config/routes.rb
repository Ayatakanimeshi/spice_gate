Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:new, :create, :index]
  resources :shops, only: [:new, :create, :show, :index]
  root 'tops#top'

  get 'firstpage' => 'firstpages#firstpage'

  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
