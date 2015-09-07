Rails.application.routes.draw do
  devise_for :admins

  root 'backend/home#dashboard'
  namespace :backend do
    get '/', to: 'home#dashboard', as: 'dashboard'
    resources :channels
    resources :categories
    resources :programs
    resources :videos
    resources :schedules
    resources :lives
    resources :images
    resources :slides, only: [:destroy, :index] do
      member do
        get 'add_image_to_slide/:id', to: 'slides#add_image_to_slide', as: 'add_image'
        get 'add_video_to_slide/:id', to: 'slides#add_video_to_slide', as: 'add_video'
      end
    end
  end
end
