Rails.application.routes.draw do
  resources 'static_pages', only: [:index]
  root to: 'static_pages#index'
end
