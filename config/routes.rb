Pathoscope::Application.routes.draw do
  devise_scope :user do
    get "/sessions/current" => "ember_devise_simple_auth/sessions#show"
***REMOVED***

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
***REMOVED***
***REMOVED***

  get "launching/index"
  post "launching/get" => 'launching#get'
  delete 'home/sign_out' => 'home#sign_out'

  devise_for :users, controllers: { sessions: 'ember_devise_simple_auth/sessions' }

***REMOVED*** The priority is based upon order of creation: first created -> highest priority.
***REMOVED*** See how all your routes lay out with "rake routes".

***REMOVED*** You can have the root of your site routed with "root"
  root 'launching#index'
***REMOVED***
