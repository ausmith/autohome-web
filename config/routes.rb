###############################################################################
# This file is part of The Autohome Project.
#
# The Autohome Project is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# The Autohome Project is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with The Autohome Project.  If not, see <http://www.gnu.org/licenses/>.
###############################################################################

AutohomeWeb::Application.routes.draw do


  # Error page handling
  match "403", :to => 'error#error_403' # Forbidden
  match "404", :to => 'error#error_404' # Not Found
  match "500", :to => 'error#error_500' # Internal Server Error

  # Administration Interface
  match "admin" => "admin#index", :as => 'admin', :via => :get

  scope "/admin" do
    resources :sensors
    resources :sensor_types
    resources :data_types
    resources :rooms
    resources :nodes

    get "event_log" => "event_log#index", :as => :event_log
    get "event_log/:id" => "event_log#show", :as => :event
  end


  # User authentication juiciness
  devise_for :users, :controllers => { 
        :registrations => "registrations",
        :sessions => "sessions"
  }
  devise_scope :user do
    get "users" => 'users#index', :as => :users
    get "users/:id" => 'users#show', :as => :user
    get "users/:id/edit" => 'registrations#edit', :as => :edit_user
    put "users/:id" => 'registrations#update', :as => :update_user
    #get "registrations/:id/edit" => 'registrations#edit', :as => :edit_registration
    #put "registrations/:id" => 'registrations#update', :as => :update_registration
  end
 
  resources :users do
    resources :access_controls
  end


  match  "dashboard" => 'dashboard#index'

  # APIs
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      put  "report" => 'data_collection#report'

      # Authentication patterns
      namespace :auth do
        post "online" => 'online#online'
        post 'rfid' => 'rfid#auth'
      end
    end
  end




  # Root path determined via Devise helper methods.
  authenticated :user do
      root :to => 'dashboard#index'
  end
  root :to => redirect('/users/sign_in')

  # This should be redundant; leave for now, but we may rip this out later
  root :to => 'dashboard#index'
end
