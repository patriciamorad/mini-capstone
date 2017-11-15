class ProductsController < ApplicationController

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

  def handbag_method
    product = Product.fifth 
    render json: product.as_json 
  end 

  def all_products_method
    product = Product.all
    render json: product.as_json
  end 
end
