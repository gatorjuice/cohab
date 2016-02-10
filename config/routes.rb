Rails.application.routes.draw do
  
  get '/welcome' => 'pages#welcome'

  get '/partnerships/new' => 'partnerships#new'
  get '/partnerships/:id' => 'partnerships#show'
  post '/partnerships' => 'partnerships#create'
  post '/partnerships/add_member' => 'partnerships#add_member'


  post '/expenses' => 'expenses#create'

  get '/users/:id' => 'users#show'
  patch '/users' => 'users#login'
  delete '/users' => 'users#logout'
  
  
  

  namespace :api do

  end

end
