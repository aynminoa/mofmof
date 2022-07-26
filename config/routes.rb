Rails.application.routes.draw do
  resources :nearest_stations
  root "properties#index"
  resources :properties
  
end
