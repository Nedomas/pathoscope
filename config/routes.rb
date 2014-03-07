Pathoscope::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :paths, only: :index
***REMOVED***
***REMOVED***

  get "map/index"
  get "install/bookmarklet"
  get "launching/index"
  post "launching/get" => 'launching#get'

  get "comments/create"
  get 'comments/index'

  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }

***REMOVED*** The priority is based upon order of creation: first created -> highest priority.
***REMOVED*** See how all your routes lay out with "rake routes".

***REMOVED*** You can have the root of your site routed with "root"
  root 'paths#index'

  get 'map' => 'map#index', as: 'map'
  get 'map/data' => 'map#data', as: 'map_data'

  get 'world' => 'world#index', as: 'world_index'
  get 'world/:item_id' => 'world#show', as: 'world'
  get 'world/data/:item_id' => 'world#data', as: 'world_data'

  get 'bookmarks/data' => 'bookmarks#data', as: 'bookmarks_data'
  get 'bookmarks/templates' => 'bookmarks#templates'

***REMOVED*** Example of regular route:
  get 'paths' => 'paths#index', as: 'paths_index'
  get 'paths/choose/:id' => 'paths#choose', as: 'choose'

  get 'expertise/start/:path_id' => 'expertise#start', as: 'expertise_start'
  get 'expertise/start/:path_id/:node_id' => 'expertise#start', as: 'expertise_continue'
***REMOVED*** get 'expertise/finish/:path_id/:node_id' => 'expertise#finish', as: 'expertise_finish'
***REMOVED*** get 'expertise/continue/:path_id/:node_id' => 'expertise#continue', as: 'expertise_continue'

  get 'install' => 'install#bookmarklet', as: 'install'

  get 'bookmarks/create' => 'bookmarks#create', as: 'bookmarks_create'
  get 'bookmarks/begin' => 'bookmarks#begin'
  get 'bookmarks/tag' => 'bookmarks#tag'
  get 'bookmarks/links' => 'bookmarks#links'

***REMOVED*** # get 'explore' => 'explore#index'
  get 'paths/:id' => 'paths#show', as: 'paths'

***REMOVED*** post 'paths/create' => 'paths#create', as: 'paths_create'
  post 'input/search' => 'input#search'
  post 'input/create' => 'input#create'

  get "ego/index"
  get "ego/road/:id" => 'ego#road', as: 'ego_road'
  get "ego/link/:id" => 'ego#link', as: 'ego_link'
***REMOVED*** resources :explore

***REMOVED*** Example of named route that can be invoked with purchase_url(id: product.id)
***REMOVED***   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

***REMOVED*** Example resource route (maps HTTP verbs to controller actions automatically):
***REMOVED***   resources :products

***REMOVED*** Example resource route with options:
***REMOVED***   resources :products do
***REMOVED***     member do
***REMOVED***       get 'short'
***REMOVED***       post 'toggle'
***REMOVED*** ***REMOVED***
***REMOVED***
***REMOVED***     collection do
***REMOVED***       get 'sold'
***REMOVED*** ***REMOVED***
***REMOVED*** ***REMOVED***

***REMOVED*** Example resource route with sub-resources:
***REMOVED***   resources :products do
***REMOVED***     resources :comments, :sales
***REMOVED***     resource :seller
***REMOVED*** ***REMOVED***

***REMOVED*** Example resource route with more complex sub-resources:
***REMOVED***   resources :products do
***REMOVED***     resources :comments
***REMOVED***     resources :sales do
***REMOVED***       get 'recent', on: :collection
***REMOVED*** ***REMOVED***
***REMOVED*** ***REMOVED***

***REMOVED*** Example resource route with concerns:
***REMOVED***   concern :toggleable do
***REMOVED***     post 'toggle'
***REMOVED*** ***REMOVED***
***REMOVED***   resources :posts, concerns: :toggleable
***REMOVED***   resources :photos, concerns: :toggleable

***REMOVED*** Example resource route within a namespace:
***REMOVED***   namespace :admin do
***REMOVED***   ***REMOVED*** Directs /admin/products/* to Admin::ProductsController
***REMOVED***   ***REMOVED*** (app/controllers/admin/products_controller.rb)
***REMOVED***     resources :products
***REMOVED*** ***REMOVED***
***REMOVED***
