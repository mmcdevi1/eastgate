Rails.application.routes.draw do

  # get '', to: 'hatches#index', constraints: {subdomain: 'hatch'}

  constraints(subdomain: 'hatch') do
    get '', to: 'hatches#index'
  end

  devise_for :users
  devise_scope :user do
    get  '/register', to: 'devise/registrations#new', as: :register
    get  '/profile/edit', to: 'devise/registrations#edit', as: :edit

    get  '/login', to: 'devise/sessions#new', as: :login
    get  '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  resources 'static_pages', only: [:index]
  get '/test', to: 'static_pages#test'
  root to: 'static_pages#index'

end
