Taskme::Application.routes.draw do
  #resources :activities

  match '/rate' => 'rater#create', :as => 'rate', via: [:get, :post]
  get "home", to: 'static_pages#home', as: 'home'
  get "help", to: 'static_pages#help', as: 'help'
  get "contact", to: 'static_pages#contact', as: 'contact'
  get "howitworks", to: 'static_pages#howitworks', as: 'howitworks'
  get "mytasks", to: 'static_pages#mytasks', as: 'mytasks'
  get "about", to: 'static_pages#about', as: 'about'
  get "security", to: 'static_pages#security', as: 'security'
  get "howtobeexecutor", to: 'static_pages#howtobeexecutor', as: 'howtobeexecutor'
  get "mymadetask", to: 'static_pages#mymadetask', as: 'mymadetask'
  get "notification", to: "activities#notification", as: :notification

  match 'read_all' => 'activities#read_all', :as => :read_all, via: [:get, :post]
  
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:show, :index, :update, :edit], shallow: true do
    resources :verifications
  end

  #devise_for :users, :controllers => { :registrations => "users" }
  
  resources :verifications
   
  resources :categories, shallow: true do
  resources :posts, shallow: true do
    resources :responces
    resources :reviews
    resources :reviewfromexecutors
    resources :comments, only: [:new, :create, :destroy]
    end
  end

  resources :conversations do
    resources :messages
  end

  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  match 'posts/:id/new_review' => 'reviews#new_review', :as => :new_review, via: [:get, :post]
  match 'posts/:id/completed' => 'posts#completed', :as => :completed_post, via: [:get, :post]
  match 'posts/:id/uncompleted' => 'posts#uncompleted', :as => :uncompleted_post, via: [:get, :post]
  match 'posts/:id/completedexecutor' => 'posts#completedexecutor', :as => :completedexecutor_post, via: [:get, :post]
  match 'posts/:id/uncompletedexecutor' => 'posts#uncompletedexecutor', :as => :uncompletedexecutor_post, via: [:get, :post]

  match 'posts/:id/executor_choose' => 'posts#executor_choose', :as => :choose_executor, via: [:get, :post, :patch]
  get 'all_post', to: 'posts#post_all'
  match 'users/:id/change_role', to: 'users#change_role', as: :change_role, via: [:get, :post]
  


  root to: 'static_pages#home'

  resources :ecategories, only: [:show], shallow: true do
    resources :users, only: [:index]
  end
  
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