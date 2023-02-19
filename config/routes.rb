Rails.application.routes.draw do
  resources :interviews
  resources :contacts
  root "public#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords"
  }
  resources :jobs
  get "/about-us", to: "public#about"
  get "/contact-us", to: "public#contact"

  get "dashboard", to: "jobs#dashboard"
end
