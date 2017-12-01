require "unirest"
require "pp"

while true 
  system "clear"
  puts "Welcome to this boutique! Please make a selection:"
  puts "[1] I want to see all of the products"
  puts "[1.5] I want to see the products sorted by price"
  puts "[2] I want to see one of the products"
  puts "[2.5] I want to search a product by its name"
  puts 
  puts "[3] I want to create my own product"
  puts "[4] I want to update an existing product"
  puts "[5] I want to delete an existing product"
  puts
  puts "[order] I want to make an order"
  puts "[view] I want to view all of my orders"
  puts
  puts "[signup] Signup (create a user)"
  puts "[login] Login (create a JSON web token)"
  puts "[logout] Logout (create a JSON web token)"
  puts
  puts "[q] QUIT"

  user_input = gets.chomp

  if user_input == "1"
    response = Unirest.get("http://localhost:3000/v1/products") 
    products = response.body 
    pp products 
  elsif user_input == "1.5"
    response = Unirest.get("http://localhost:3000/v1/products?sort_by_price=true")
    products = response.body 
    pp products
  elsif user_input == "2"
    print "Which product would you like to see?"
    product_id = gets.chomp
    response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
    product = response.body 
    pp product
  elsif user_input == "2.5"
    params = {}
    print "Enter search terms:"
    search_terms = gets.chomp 
    response = Unirest.get("http://localhost:3000/v1/products?search=#{search_terms}")
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
    if product["errors"]
      puts "Nope.Try again."
      p product["errors"]
    else 
      puts "All good!"
      pp product 
    end
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
    if product["errors"]
      puts "Nope.Try again."
      p product["errors"]
    else 
      puts "All good!"
      pp product 
    end
  elsif user_input == "5"
    print "Which product do you want to destroy?"
    product_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/v1/products/#{product_id}")
    pp response.body

  elsif user_input == "order"
    params = {}
    print "Please type the ID of your product: "
    params[:product_id] = gets.chomp 
    print "Please type the quantity you wish to order (integer): "
    params[:quantity] = gets.chomp 
    response = Unirest.post("http://localhost:3000/v1/orders", parameters: params)
    pp response.body
  elsif user_input == "view"
    print "Here are all of your orders: "
    puts 
    response = Unirest.get("http://localhost:3000/v1/orders")
    orders = response.body
    pp orders
  elsif user_input == "signup"
    params = {}
    print "Name: "
    params[:name] = gets.chomp
    print "Email: "
    params[:email] = gets.chomp
    print "Password: "
    params[:password] = gets.chomp
    print "Please confirm password: "
    params[:password_confirmation] = gets.chomp
    response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
    pp response.body 
  elsif user_input == "login"
    puts "Login to the app"
    params = {}
    print "Email: "
    params[:email] = gets.chomp 
    print "Password: "
    params[:password] = gets.chomp 
    response = Unirest.post("http://localhost:3000/user_token", 
      parameters: {auth: {email:  params[:email], password: params[:password]}} 
    )
    pp response.body

    #Save the JSON web token from the response
    jwt = response.body["jwt"]
    #include jwt in the headers of any future web requests 
    Unirest.default_header("Authorization", "Bearer #{jwt}")

  elsif user_input == "logout"
    jwt = ""
    Unirest.clear_default_headers()
  elsif user_input == "q"
    puts "Goodbye!"
    break
  end
  puts 
  puts "Press enter to continue"
  gets.chomp
end 
