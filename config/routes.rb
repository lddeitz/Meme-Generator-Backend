Rails.application.routes.draw do

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do

    #users routes
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#edit"

    #memes routes
    post "/memes" => "memes#create"
    get "/memes/:id" => "memes#show"

  end 

end
