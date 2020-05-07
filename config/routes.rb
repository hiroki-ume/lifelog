Rails.application.routes.draw do
  get 'comments/edit'
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'follower' => 'relationships#follower', as: 'following'
    get 'followed' => 'relationships#followed', as: 'followed'
  end
  root "homes#top"
  resources :posts do
    resource :favorites, only: [:index, :create, :destroy]
    resource :comments, only: [:create, :edit, :update, :destroy]
  end
  get '/posts/:post_id/favorites' => 'favorites#index', as: "favorites"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
