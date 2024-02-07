Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users, param: :_username
  post 'auth/login', to: 'authentication#login'
  resources :personals, only: %i[create update show]
  resources :parents, only: %i[create update show]
  resources :sources, only: %i[create update show]
  resources :majors, only: %i[create update show]
  resources :organizations, only: %i[create update show]
  resources :extras, only: %i[create update show]
  resources :utbk_scores, only: %i[create update show]
  resources :utbk_school_informations, only: %i[create update show]
  resources :usm_school_informations, only: %i[create update show]
  resources :pmdk_total_score_informations, only: %i[create update show]
  resources :pmdk_school_informations, only: %i[create update show]
  resources :pmdk_each_score_informations, only: %i[create update show]
  resources :languages, only: %i[create update show]
  resources :achievements, only: %i[create update show]
  resources :addresses, only: %i[create update show]

  get '/*a', to: 'application#not_found'
end
