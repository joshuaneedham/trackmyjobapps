Rails.application.routes.draw do
  root 'public#index'
  devise_for :users
  get '/about-us', to: 'public#about'
  get '/contact-us', to: 'public#contact'
  
end
