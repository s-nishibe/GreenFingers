Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root to: 'homes#top'

  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'

  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :drafts, only: [:new, :create, :index, :edit, :update, :destroy]
  post 'drafts/preview' => 'drafts#preview', as: 'draft_preview'
  get 'drafts/:id/success' => 'draft#success', as: 'draft_success'

  resources :blogs, only: [:create, :index, :show, :edit, :update, :destroy] do
    resource :blog_comments, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :stamps, only: [:create, :destroy]

  resources :topics, only: [:new, :create, :index,  :edit, :show, :update] do
    resources :topic_comments, only: [:new, :create, :destroy]
  end
end

