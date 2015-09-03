Rails.application.routes.draw do
  devise_for :admins
  root 'home#dashboard'

  namespace :backend do
    get '/', to: 'home#dashboard', as: 'dashboard'
  end
end
