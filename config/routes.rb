Pathoscope::Application.routes.draw do
  use_doorkeeper
***REMOVED*** devise_scope :user do
***REMOVED***   get "/sessions/current" => "ember_devise_simple_auth/sessions#show"
***REMOVED*** ***REMOVED***

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
***REMOVED***
***REMOVED***

  get "launching/index"
  post "launching/get" => 'launching#get'
  delete 'home/sign_out' => 'home#sign_out'

***REMOVED*** devise_for :users, controllers: { sessions: 'ember_devise_simple_auth/sessions' }

***REMOVED*** The priority is based upon order of creation: first created -> highest priority.
***REMOVED*** See how all your routes lay out with "rake routes".

***REMOVED*** You can have the root of your site routed with "root"
  root 'launching#index'
***REMOVED***
