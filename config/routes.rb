Rails.application.routes.draw do
  devise_for :admins
  namespace :api do
    namespace :v1 do
      post 'admin/login', to: "admin#login"
      resources :categories
      get 'home/index'
    end
  end  
  root to: 'api/v1/home#index'
end
