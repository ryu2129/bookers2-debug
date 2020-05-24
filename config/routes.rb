Rails.application.routes.draw do
  root 'home#top' #上から処理をするので順番が重要
  get 'home/about'
  devise_for :users

  resources :users, only: [:show, :index, :edit, :update] do
    resources :follows, only: [:index]
    resources :followers, only: [:index]
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create]
  end

  resources :book_comments, only: [:destroy]
  
  resources :relationships, only: [:create, :destroy]
end #追加