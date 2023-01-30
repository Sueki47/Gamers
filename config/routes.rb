Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  root to: 'homes#top'
  get '/search', to: 'searches#search'

  get 'home/about', to: 'homes#about'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :games, only: [:edit, :create, :index, :show, :update, :destroy] do
    resources :post_reviews, only: [:create, :show, :edit, :destroy, :update] do
      resource :favorites, only: [:create, :destroy]
    end
  end
end