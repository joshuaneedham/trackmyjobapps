Rails.application.routes.draw do
  root 'public#index'
  devise_for :users
  get 'public/about'
  get 'public/contact'
  get '/privacy', to: 'public#privacy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
