Pathoscope::Application.routes.draw do
  get "explore/index"
***REMOVED*** The priority is based upon order of creation: first created -> highest priority.
***REMOVED*** See how all your routes lay out with "rake routes".

***REMOVED*** You can have the root of your site routed with "root"
***REMOVED*** root 'welcome#index'

***REMOVED*** Example of regular route:
***REMOVED***   get 'products/:id' => 'catalog#view'

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
