Rails.application.routes.draw do

  ##### Routes for Hatch ################W
  scope :hatch do
    get '/', to: 'hatches#index', as: :index

    resources :assets do
      get '/financials', to: 'assets#financials'
      get '/approvals/approved', to: 'approvals#approved'
      get '/documents/get/:id', to: 'documents#get', as: :download
      get 'folders/download', to: 'documents#download', as: :download_full

      resources :approvals, only: [:index, :show, :update]
      resources :images, only: [:index, :show]
      resources :hot_points, only: [:index, :show]
      resources :business_plans, only: [:index, :show]
      resources :timelines, only: [:index, :show]
      resources :folders, only: [:index, :show]
      resources :documents, only: [:index, :show]
    end
  end

  namespace :admin do
    root to: 'dashboards#index'
    get '/file-manager', to: 'assets#file_manager', as: :file_manager

    scope :pipeline do
      # root to: 'dashboards#index'
      resources :assets do
        get '/folders/:folder_id/new', to: 'folders#new', as: :new_sub_folder
        get '/documents/get/:id', to: 'documents#get', as: :download
        resources :folders do
          resources :documents
        end
      end

      get '/users/admins', to: 'users#admins'
      post '/users/new' => 'users#create', as: :create_user_post
      get '/users/new', to: 'users#new', as: :create_user
      get '/users', to: 'users#index'
      get '/users/:id', to: 'users#show', as: :user
    end

    resources :clients
    resources :timelines
    resources :approvals





    resources :users, only: [:destroy, :edit]

    # Thelius Website Content
    scope :config do
      scope :website do
        # Who we are
        get '/who-we-are', to: 'general_contents#index', as: :who_we_are

        # Team member
        resources :executive_teams, :path => 'team'
      end

      scope :applications do
        resources :career_applications, only: [:index, :show, :destroy], :path => 'candidates'
        resources :job_categories, :path => 'categories'
        resources :employment_types, :path => 'employment'
        resources :minimum_experiences, :path => 'experience'
        resources :job_postings, :path => 'jobs'
      end
    end
  end

  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users, except: :create
  devise_scope :user do
    get  '/profile/edit', to: 'devise/registrations#edit', as: :edit
    get  '/login', to: 'devise/sessions#new', as: :login
    get  '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  ##### Routes for TheliusCapital.com ##############
  resources 'static_pages', only: [:index]
  get '/test', to: 'static_pages#test'
  get '/about', to: 'static_pages#about'

  resources :career_applications, only: [:index, :show], :path => 'careers'
  get '/careers/apply', to: 'career_applications#new'

  scope :careers do
    resources :job_postings, only: :show, :path => 'jobs' do
      resources :career_applications, only: :create
    end
  end

  root to: 'static_pages#index'

end






































