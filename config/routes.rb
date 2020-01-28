Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :posts
      resources :admin_users

      root to: "users#index"
    end


  resources :audit_logs, except: [:new, :edit, :destory] do
    member do
      get :confirm
    end
  end

  resources :posts do
    member do
      get :approve
    end
  end
  devise_for :users, skip:  [:registration]
  root to: "static#homepage"
end
