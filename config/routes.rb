Rails.application.routes.draw do
  resources :tasks
  devise_for :users
  resources :projects
  root 'projects#index'
end
