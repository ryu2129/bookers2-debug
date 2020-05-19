Rails.application.routes.draw do
  root 'home#top' #上から処理をするので順番が重要
  get 'home/about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create]
  end
  resources :book_comments, only: [:destroy]
end #追加