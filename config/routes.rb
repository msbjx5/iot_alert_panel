Rails.application.routes.draw do
  root to: 'devices#index'

  resources :devices, only: %i[index new create show destroy]
end
