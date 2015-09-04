Rails.application.routes.draw do
  devise_for :admins

  root 'backend/home#dashboard'
  namespace :backend do
    get '/', to: 'home#dashboard', as: 'dashboard'
    resources :channels
    resources :categories
    resources :programs
    resources :videos
  end
end
