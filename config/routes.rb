Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  resources :posts do
    resource :favorites, only: [:index, :create, :destroy]
  end
  get '/posts/:post_id/favorites' => 'favorites#index', as: "favorites"
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
