Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/pants_url" => "products#pants_method"
  get "/shirt_url" => "products#shirt_method"
  get "/sweatshirt_url" => "products#sweatshirt_method"
  get "/shoes_url" => "products#shoes_method"
  get "/handbag_url" => "products#handbag_method"
  get "/all_products_url" => "products#all_products_method"
end


