Rails.application.routes.draw do

  ##### Routes for Hatch ################W
  scope :hatch do
    get '/', to: 'hatches#index'

    resources :assets do
      get '/financials', to: 'assets#financials'
      get '/approvals', to: 'approvals#index'

      resources :images
      resources :hot_points
      resources :business_plans
      resources :timelines
    end

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
