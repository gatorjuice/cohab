Rails.application.routes.draw do
  
  get '/welcome' => 'pages#welcome'

  get '/partnerships/new' => 'partnerships#new'
  get 'partnerships/:id' => 'partnerships#show'
  post '/partnerships' => 'partnerships#create'
  post '/partnerships/add_member' => 'partnerships#add_member'


  post '/expenses' => 'expenses#create'
  
  
  

  namespace :api do

  end

end
