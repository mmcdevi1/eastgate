Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    get  '/register', to: 'devise/registrations#new', as: :register
    get  '/profile/edit', to: 'devise/registrations#edit', as: :edit

    get  '/login', to: 'devise/sessions#new', as: :login   
    get  '/logout', to: 'devise/sessions#destroy', as: :logout
  end  

  resources 'static_pages', only: [:index]
  root to: 'static_pages#index'

end
