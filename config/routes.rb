Rails.application.routes.draw do
  root to: 'devices#index'

  resources :devices

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'search/:mac', to: 'devices#search'
      post 'alert', to: 'devices#alert'
    end
  end
end
