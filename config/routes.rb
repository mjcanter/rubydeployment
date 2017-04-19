Rails.application.routes.draw do
  get '/sessions' => 'session#index'
  post '/register' => 'session#register'
  post '/login' => 'session#login'
  get '/logout' => 'session#logout'
  
  get '/users' => 'users#index'
  delete 'users/:id/delete' => 'users#delete'
  post 'users/:id/edit' => 'users#edit'
  post '/users/:id/like/:id' => 'users#like'
  post '/users/:id/unlike/:id' => 'users#unlike'

  get '/secrets' => 'secrets#index' 
  post '/secrets/new' => 'secrets#create' 
  delete  '/secrets/:id/delete' => 'secrets#delete'
  post '/secrets/:id/like/:id' => 'secrets#like'
  post '/secrets/:id/unlike/:id' => 'secrets#unlike'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
