Rails.application.routes.draw do
  get 'user_vehicles/new'

  get 'user_has_vehicle/new'

  get 'engine/new'

  get 'vehicle/new'

  get 'vehicle_type/new'

  get 'users_type/new'

  get 'sessions/new'

  root 'static_pages#home'

  get 'static_pages/home'

  #post 'users/new', to: 'users#new'
  get  '/create',  to: 'users#new'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  get '/logout', to:'sessions#destroy'

  resources :users


  #put '/users/:id/edit', to: 'users#edit'
 # get '/users/:id(.:format)', to: 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
