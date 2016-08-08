Rails.application.routes.draw do
  #get 'user_vehicles/new'

  #get 'user_has_vehicle/new'

  #get 'engine/new'

  get 'vehicle/new'

  #get 'vehicle_type/new'

  #get 'users_type/new'

  #get 'sessions/new'
  #get 'users/transfer'

  #get '/vehicle/:id/add_vehicle(.:format)', to:'vehicles#add_vehicle'
  root 'static_pages#home'
  post '/search', to: 'users#transfer1'
  get 'static_pages/home', to: 'static_pages#home'
  #post 'users/new', to: 'users#new'
  get  '/create',  to: 'users#new'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  get '/logout', to:'sessions#destroy'

  resources :users do
     member do
       get 'share_form'
       post 'attach_sharing'
       get 'transfer'
     end
  end
  resources :vehicles do
    member do
      post 'add'
      delete 'delete_vehicle'
      get 'add_vehicle_to_list'
    end
  end


  #put '/users/:id/edit', to: 'users#edit'
 # get '/users/:id(.:format)', to: 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
