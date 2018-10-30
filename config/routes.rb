Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/books' => 'books#index'
    get '/books/:id' => 'books#show'
    post '/books' => 'books#create'
    patch 'books/:id' => 'books#update'
    delete 'books/:id' => 'books#destroy'
    get '/authors' => 'authors#index'
    get '/authors/:id' => 'authors#show'
    post '/authors' => 'authors#create'
    patch '/authors/:id' => 'authors#update'
    delete '/authors/:id' => 'authors#destroy'
  end 
end
