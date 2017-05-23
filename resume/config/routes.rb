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
  get 'editor/show'
  get 'profiles/show'

  authenticated :user do
	  root "editor#show", as: "authenticated_root"
	end
  # root 'welcome#index'
    root 'welcome#index'

end
