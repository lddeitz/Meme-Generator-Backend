 Rails.application.routes.draw do

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do

    #users routes
    post "/users" => "users#create"
    get "/users/:id" => "users#show"

    #memes routes
    get "/memes" => "memes#index"
    post "/memes" => "memes#create"
    get "/memes/:id" => "memes#show"
    patch "/memes/:id" => "memes#update"
    delete "/memes/:id" => "memes#destroy"

    #sessions routes
    post "/sessions" => "sessions#create"
  end 

end