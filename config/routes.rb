Rails.application.routes.draw do
  resources :forum_threads do
    resources :forum_posts, only: %i[ create new]
  end
  devise_for :users
  resources :forum_subforums
  resources :forum_forums
  namespace :admin do
    resources :forum_subforums
    resources :forum_forums
  end
  devise_for :admin_users, skip: [ :registrations, :passwords, :confirmations, :unlocks ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "welcome#index"
end
