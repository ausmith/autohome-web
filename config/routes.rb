AutohomeWeb::Application.routes.draw do

  # Error page handling
  match "/403", :to => 'error#error_403' # Forbidden
  match "/404", :to => 'error#error_404' # Not Found
  match "/500", :to => 'error#error_500' # Internal Server Error

  # Administration Interface
  match "admin" => "admin#index", :as => 'admin', :via => :get

  scope "/admin" do
    resources :sensors
    resources :sensor_types
    resources :data_types
    resources :rooms
    resources :nodes
  end


  # User authentication juiciness
  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_scope :user do
    get "users" => 'users#index', :as => :users
    get "users/:id" => 'users#show', :as => :user
    get "users/:id/edit" => 'registrations#edit', :as => :edit_user
    put "users/:id" => 'registrations#update', :as => :update_user
    #get "registrations/:id/edit" => 'registrations#edit', :as => :edit_registration
    #put "registrations/:id" => 'registrations#update', :as => :update_registration
  end
 
  match  "dashboard" => 'dashboard#index'

  # APIs
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      post "online" => 'data_collection#online'
      put  "report" => 'data_collection#report'
    end
  end




  # Root path determined via Devise helper methods.
  authenticated :user do
      root :to => 'dashboard#index'
  end
  root :to => redirect('/users/sign_in')

  #get "dashboard" => 'dashboard#index', :as => :dashboard

  # This should be redundant; leave for now, but we may rip this out later
  root :to => 'dashboard#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
