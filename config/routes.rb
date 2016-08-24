Pathoscope::Application.routes.draw do
  use_doorkeeper do
    # it accepts :authorizations, :tokens, :applications and :authorized_applications
    controllers tokens: 'api/v1/tokens'
  end
  use_doorkeeper
  # devise_scope :user do
  #   get "/sessions/current" => "ember_devise_simple_auth/sessions#show"
  # end

  devise_for :users, controllers: { sessions: 'sessions' }

  get 'beta' => 'home#index'

  namespace :api do
    namespace :v1 do
      resources :maps
      resources :worlds
      resources :paths
      resources :links
      resources :items
      resources :user_paths
      resources :users
      resources :notes
      get 'credentials/me' => 'credentials#me'
      get 'expertise/road' => 'expertise#road'
    end
  end

  get "launching/index"
  post "launching/get" => 'launching#get'
  delete 'home/sign_out' => 'home#sign_out'
  get 'explore' => 'bookmarks#redirect_explore'

  # devise_for :users, controllers: { sessions: 'ember_devise_simple_auth/sessions' }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'launching#index'
end
