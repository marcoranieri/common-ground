Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # resources :posts, only: [ :index ]
    end
  end

  resources :mentions, only: [ :index ]

  resources :posts do
    resources :comments, module: :posts
  end

  get 'profile/:id' => 'profiles#show', as: 'profile'

  resources :comments do
    resources :comments, module: :comments
  end

  get "info", to: "pages#info"

  root to: 'posts#index'
end
