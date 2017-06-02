Rails.application.routes.draw do
  resources :wikis
  resources :wikis, only: [] do
    resource :collaborators, only: [:edit]
  end
  resources :charges, only: [:new, :create]
  resources :downgrades, only: [:new, :create]
  devise_for :users
  get 'about' => 'welcome#about'
  get 'blocipedia' => 'welcome#index'
  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end
  root 'welcome#index'
end
