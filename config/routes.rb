Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories
      get 'home/index'
    end
  end  
  root to: 'api/v1/home#index'
end
