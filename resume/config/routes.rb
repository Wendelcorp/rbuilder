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

  authenticated :user do
	  root "editor#index", as: "authenticated_root"
	end
  # root 'welcome#index'
    root 'welcome#index'

end
