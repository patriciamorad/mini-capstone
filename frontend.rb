require "unirest"
require "pp"

system "clear"
puts "Welcome to this boutique! Please make a selection:"
puts "[1] I want to see all of the products"
puts "[2] I want to see one of the products"
puts "[3] I want to create my own product"
puts "[4] I want to update an existing product"
puts "[5] I want to delete an existing product"

user_input = gets.chomp

if user_input == "1"
  response = Unirest.get("http://localhost:3000/v1/products") 
  products = response.body 
  pp products 
elsif user_input == "2"
  print "Which product would you like to see?"
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
  product = response.body 
  pp product
elsif user_input == "3"
  params = {}
  print "Please enter a product name:"
  params["input_name"] = gets.chomp 
  print "Please enter a product price:"
  params["input_price"] = gets.chomp 
  print "Please enter a product description:"
  params["input_description"] = gets.chomp 
  response = Unirest.post("http://localhost:3000/v1/products", parameters: params)
  product = response.body 
  pp product
elsif user_input == "4"
  print "Which product do you wish to update?"
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{product_id}") 
  product = response.body
  params = {}
  print " What is the new product name (#{product["name"]}):"
  params["input_name"] = gets.chomp
  print "What is the new product price (#{product["price"]}):"
  params["input_price"] = gets.chomp
  print "What is the new product description(#{product["description"]}):"
  params["input_description"] = gets.chomp 
  response = Unirest.patch("http://localhost:3000/v1/products/#{product_id}", parameters: params)
  product = response.body
  pp product 
elsif user_input == "5"
  print "Which product do you want to destroy?"
  product_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/products/#{product_id}")
  pp response.body
end 
