Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get 'comments/new' => 'comments#new'
  # get 'comments/create' => 'comments#create'
  root 'posts#index'
  get 'about' => 'pages#about'
  get 'privacy' => 'pages#privacy'
  get 'terms' => 'pages#terms'
  get 'contact' => 'pages#contact'
  resources :posts, only: [:show, :create]
  post 'posts/:id' => 'posts#comment'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
