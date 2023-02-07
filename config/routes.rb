Rails.application.routes.draw do
  devise_for :users
  root 'public#index'
  get 'public/about'
  get 'public/contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
