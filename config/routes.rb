Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  root to: 'pages#home'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users
  # get '/users' => "users#show", :as => :user_root
end
