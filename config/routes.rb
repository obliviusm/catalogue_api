Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories, only: :index
      resources :items, only: :show
    end
  end
end
