Rails.application.routes.draw do
  resources :players
  resources :teams
  root to: 'visitors#index'
end
