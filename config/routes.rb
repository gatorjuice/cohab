Rails.application.routes.draw do
  
  get '/welcome' => 'pages#welcome'

  get '/partnerships/new' => 'partnerships#new'
  get 'partnerships/:id' => 'partnerships#show'
  post '/partnerships' => 'partnerships#create'


  post '/expenses' => 'expenses#create'

  namespace :api do

  end

end
