require "Unirest"
require "pp"

puts "Choose a product you would like to purchase:"
# puts "[1] I want to purchase pants"
# puts "[2] I want to purchase a shirt"
# puts "[3] I want to purchase a sweatshirt"
# puts "[4] I want to purchase shoes"
# puts "[5] I want to purchase a handbag"
puts "[6] I want to see all of the products"

user_input = gets.chomp 
if user_input == "6"
  response = Unirest.get("http://localhost:3000/all_products_url") 
  products = response.body 
  pp products 
end 
