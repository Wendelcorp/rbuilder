Rails.application.routes.draw do
  get 'welcome/index'
  get 'editor/index'

  root 'welcome#index'

  resources :educations
  resources :experiences
  resources :profiles
  resources :skills
end
