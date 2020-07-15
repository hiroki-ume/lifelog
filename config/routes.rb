Rails.application.routes.draw do
  #ユーザー側
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'follower' => 'relationships#follower', as: 'following'
    get 'followed' => 'relationships#followed', as: 'followed'
  end
  root "homes#about"
  get 'about' => 'homes#about'
  get 'top' => 'homes#top'
  get "genres/:genre_id" => "posts#genre"
  resources :posts do
    get :search, on: :collection
    resource :favorites, only: [:index, :create, :destroy]
    resource :comments, only: [:create, :edit, :update, :destroy]
  end
  get '/user/:user_id/follower_posts' => 'posts#follower_posts', as: "follower_posts"
  get '/user/:user_id/favorite_posts' => 'posts#favorite_posts', as: "favorite_posts"
  get '/posts/:post_id/favorites' => 'favorites#index', as: "favorites"
  get '/ranking' => 'posts#ranking', as: "ranking"
  resources :inquiries, only: [:index, :new, :create]
  post 'inquiries/confirm' => 'inquiries#confirm'

  #管理側
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: "new_admin_session"
    post 'admins/sign_in' => 'admins/sessions#create', as: "admin_session"
    get 'admins/sign_out' => 'admins/sessions#destroy', as: "destroy_admin_session"
  end
  namespace :admins do
    resources :genres, only: [:index, :create, :update]
  end



  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
