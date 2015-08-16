Rails.application.routes.draw do

  get("/static/faq", { :controller => "static", :action => "faq"})

  get("/static/about", { :controller => "static", :action => "about"})

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Routes to CREATE row in REVIEW table
  # post("reviews/:id/post_new_review", { :controller => "reviews", :action => "new_review"})

  # Should this be in batches? Since we're creating a new review for a batch??
  # post("batches/:id/post_new_review", { :controller => "batches", :action => "new_review"})

  # Route to access user's reviewed batches
  get("reviewed_batches", { :controller => "reviews", :action => "reviewed"})

  # Routes to CREATE row in MIRROR table
  get("/mirrors/input", { :controller => "mirrors", :action => "input_form"})

  # get("/match_brew", { :controller => "mirrors", :action => "match_num"})
  # get("/match_brew", { :controller => "uniques", :action => "match_num"})

  # get("/match_brew", { :controller => "mirrors", :action => "match_num"})
  get("/match_brew", { :controller => "unis", :action => "match_num"})

  # Creates new row in UNIQUES table (per the action generate_uniques), from Batch#show
  post("batches/:id/generate_uniques", { :controller => "batches", :action => "generate_uniques"})

  # Creates new row in UNIQUES table (per the action generate_uniques), from Batch#show
  post("batches/:id/generate_unis", { :controller => "batches", :action => "generate_unis"})

  # post("uniques/:id/generate_uniques", { :controller => "uniques", :action => "generate_uniques"})


  resources :unis

  resources :mirrors

  resources :uniques

  resources :reviews

  resources :batches

  resources :recipes

  resources :styles

  devise_for :users

  devise_scope :user do
    root "devise/registrations#edit"
  end



  # devise_for :users, controllers: { registrations: "users/registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
