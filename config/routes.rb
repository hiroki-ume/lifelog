Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'follower' => 'relationships#follower', as: 'following'
    get 'followed' => 'relationships#followed', as: 'followed'
  end
  root "homes#top"
  get 'about' => 'homes#about'
  resources :posts do
    get :search, on: :collection
    resource :favorites, only: [:index, :create, :destroy]
    resource :comments, only: [:create, :edit, :update, :destroy]
  end
  get '/user/:user_id/follower_posts' => 'posts#follower_posts', as: "follower_posts"
  get '/user/:user_id/favorite_posts' => 'posts#favorite_posts', as: "favorite_posts"
  get '/posts/:post_id/favorites' => 'favorites#index', as: "favorites"
  get '/ranking' => 'posts#ranking', as: "ranking"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
