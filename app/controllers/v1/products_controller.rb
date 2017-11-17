class V1::ProductsController < ApplicationController

  def pants_method
    product = Product.first
    render json: product.as_json
  end 

  def shirt_method 
    product = Product.second
    render json: product.as_json
  end

  def sweatshirt_method
    product = Product.third
    render json: product.as_json
  end 

  def shoes_method
    product = Product.fourth
    render json: product.as_json
  end

  def index
    products = Product.all
    render json: products.as_json
  end 

  def show
    product_id = params["id"]
    product = Product.find_by(id:product_id)
    render json: product.as_json
  end

  def create
    product = Product.new(
      name: params["input_name"], 
      price: params["input_price"], 
      description: params["input_description"]
    )
    product.save
    render json: product.as_json
  end

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["input_name"]
    product.price = params["input_price"]
    product.description = params["input_description"]
    product.save
    render json: product.as_json
  end 

  def destroy 
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.destroy 
    render json: {message: "You have successfully destroyed the product"}
  end 
end
