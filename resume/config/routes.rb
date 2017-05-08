Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'editor/index'

  # root 'welcome#index'
    root 'editor#index'
  resources :educations
  resources :experiences
  resources :profiles
  resources :skills
end
