Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/pants_url" => "products#pants_method"
  # get "/shirt_url" => "products#shirt_method"
  # get "/sweatshirt_url" => "products#sweatshirt_method"
  # get "/shoes_url" => "products#shoes_method"

  namespace :v1 do 
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
  end 
end


