Rails.application.routes.draw do
  resources :jobs
  root 'public#index'
  devise_for :users
  get '/about-us', to: 'public#about'
  get '/contact-us', to: 'public#contact'
  
end
