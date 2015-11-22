Rails.application.routes.draw do
  root to: 'home#index'
  post 'home/favourite/:id_api', to: 'home#favourite', as: 'home_favourite'
end
