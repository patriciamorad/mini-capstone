class V1::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    products = Product.all.order(:id => :asc)
    search_terms = params[:search]
    if search_terms
      products = products.where("name ILIKE ?", "%#{params[:search]}%")
    end 
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
      description: params["input_description"],
      user_id: current_user.id
    )
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :bad_request
    end
  end
  

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["input_name"]
    product.price = params["input_price"]
    product.description = params["input_description"]
    product.active = params["active"]
    if product.save 
      render json: product.as_json
    else 
      render json: {errors: product.errors.full_message}, status: bad_request
    end
  end 

  def destroy 
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.destroy 
    render json: {message: "You have successfully destroyed the product"}
  end 
end
