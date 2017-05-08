Rails.application.routes.draw do

  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}

  resources :users do
    member do
      resources :educations
      resources :experiences
      resources :profiles
      resources :skills
    end
  end

  get 'welcome/index'
  get 'profiles/populate_content'
  get 'editor/index'

  # root 'welcome#index'
    root 'editor#index'

end
