Rails.application.routes.draw do
  root to: 'home#index'
  post 'home/favourite/:api_id', to: 'home#favourite', as: 'home_favourite'
end
