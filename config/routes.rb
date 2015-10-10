Rails.application.routes.draw do

  ##### Routes for Hatch ################W
  scope :hatch do
    resources :assets do
      get '/financials', to: 'assets#financials'
      get '/approvals/approved', to: 'approvals#approved'
      resources :approvals, only: [:index, :show, :update]
      resources :images, only: [:index, :show]
      resources :hot_points, only: [:index, :show]
      resources :business_plans, only: [:index, :show]
      resources :timelines, only: [:index, :show]
    end
  end

  namespace :admin do
    get '/', to: 'assets#index'
    resources :assets
    resources :clients
    resources :timelines
    resources :approvals
  end

  devise_for :users
  devise_scope :user do
    get  '/register', to: 'devise/registrations#new', as: :register
    get  '/profile/edit', to: 'devise/registrations#edit', as: :edit

    get  '/login', to: 'devise/sessions#new', as: :login
    get  '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  ##### Routes for Eastgate.io ##############
  resources 'static_pages', only: [:index]
  get '/test', to: 'static_pages#test'
  root to: 'static_pages#index'

end
