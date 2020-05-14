Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts
  resources :users
  get '/users/:id' => "users#show", :as => :user_root
end
