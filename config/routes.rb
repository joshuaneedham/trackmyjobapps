Rails.application.routes.draw do
  root 'public#index'
  get '/about-us', to: 'public#about'
  get '/contact-us', to: 'public#contact'
  
end
