Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: redirect('/api-docs')

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
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
      # handling file upload
      resources :pmdk_file_uploads, only: %i[update create]
      # for list data
      resources :accreditation_school_lists, only: %i[create update show destroy index]
      resources :achievement_kategori_lists, only: %i[create update show destroy index]
      resources :achievement_tingkat_lists, only: %i[create update show destroy index]
      resources :address_province_lists, only: %i[create update show destroy index]
      resources :address_kabupaten_lists, only: %i[create update show destroy index]
      resources :address_kecamatan_lists, only: %i[create update show destroy index]
      resources :all_school_lists, only: %i[create update show destroy index]
      resources :batch_lists, only: %i[create update show destroy index]
      resources :extra_lists, only: %i[create update show destroy index]
      resources :high_school_major_lists, only: %i[create update show destroy index]
      resources :language_degree_lists, only: %i[create update show destroy index]
      resources :language_name_lists, only: %i[create update show destroy index]
      resources :major_lists, only: %i[create update show destroy index]
      resources :organization_degree_lists, only: %i[create update show destroy index]
      resources :parent_education_lists, only: %i[create update show destroy index]
      resources :parent_job_lists, only: %i[create update show destroy index]
      resources :personal_gender_lists, only: %i[create update show destroy index]
      resources :personal_religion_lists, only: %i[create update show destroy index]
      resources :pmdk_school_lists, only: %i[create update show destroy index]
      resources :source_information_lists, only: %i[create update show destroy index]
      resources :source_motivation_lists, only: %i[create update show destroy index]

      get '/*a', to: 'application#not_found'
    end
  end
end
