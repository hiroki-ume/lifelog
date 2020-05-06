Rails.application.routes.draw do
  get 'comments/edit'
  devise_for :users
  root "homes#top"
  resources :posts do
    resource :favorites, only: [:index, :create, :destroy]
    resource :comments, only: [:create, :edit, :update, :destroy]
  end
  get '/posts/:post_id/favorites' => 'favorites#index', as: "favorites"
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
