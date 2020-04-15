Rails.application.routes.draw do
  get 'plants/edit'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  root to: 'homes#top'

  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'

  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :drafts, only: [:new, :create, :index, :edit, :update, :destroy]
  post 'drafts/preview' => 'drafts#preview', as: 'draft_preview'

  resources :blogs, only: [:create, :index, :show, :edit, :update, :destroy] do
    resource :blog_comments, only: [:create, :destroy]
    resource :stamps, only: [:create, :destroy]
  end

  resources :topics do
    resource :topic_comments, only: [:create, :destroy]
  end

  resources :relationships, only:[:create, :destroy]

  resources :plants, only:[:create, :edit, :update, :destroy]
end
