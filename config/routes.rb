Rails.application.routes.draw do
  # resources :surveys
  resources :surveys do
    member do
      get 'select_language'
      get 'start_survey/:language', to: 'questions#start_survey', as: :start_survey
    end
  end
  resources :questions
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'home/index'
  root "home#index"
end
