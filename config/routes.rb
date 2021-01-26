Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'users/index'
  end
  namespace :site do
    get 'welcome/index'
  end
  devise_for :admins
  devise_for :users

  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
    resources :users
    resources :admins
  end

  root to: 'site/welcome#index'  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
