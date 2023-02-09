Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'public#index'
  get 'public/about'
  get 'public/contact'
  get '/privacy', to: 'public#privacy'
end
