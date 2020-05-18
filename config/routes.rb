Rails.application.routes.draw do
  root 'home#top' #上から処理をするので順番が重要
  get 'home/about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
end #追加