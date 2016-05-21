Rails.application.routes.draw do
  devise_for :users

  resources :news_feeds, only: :index
  resources :comments, only: :create

  root 'news_feeds#index'
end
