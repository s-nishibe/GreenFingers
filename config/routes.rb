Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root to: 'homes#top'

  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'

  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :drafts, only: [:new, :create, :index, :edit, :update, :destroy]
  patch 'drafts' => 'drafts#preview', as: 'update_draft_preview'
  post 'drafts/preview' => 'drafts#preview', as: 'draft_preview'

  resources :blogs, only: [:create, :index, :show, :edit, :update, :destroy] do
    resource :blog_comments, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :stamps, only: [:create, :destroy]

  resources :topics do
    resources :topic_comments, only: [:new, :create, :destroy]
  end
end

