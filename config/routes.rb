Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/backgrounds', to: 'image_search#show'
      resources :users, only: [:create]
    end
  end
end
