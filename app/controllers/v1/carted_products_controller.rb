class V1::CartedProductsController < ApplicationController

  def index 
    carted_products = current_user.carted_products.where(status: "carted") 
    render json: carted_products.as_json
  end 

  def create 
    carted_product = CartedProduct.new(
      user_id: current_user.id, 
      # order_id: , 
      product_id: params[:product_id_input], 
      quantity: params[:quantity_input], 
      status: "carted")
    if carted_product.save 
      render json: carted_product.as_json 
    else 
      render json: {errors: carted_product.errors.full_message}, status: :bad_request
    end
  end

  def update
    carted_product = CartedProduct.where("status ILIKE ? AND user_id ILIKE
       ?", "#{carted}", "#{current_user.id}")
    if params[:purchase]
      carted_product.status = "purchased"
      carted_product.order_id = current_order.id 
    elsif params[:remove]
      carted_product.status = "removed"
    end
    render json: carted_product.as_json
  end  

  def destroy 
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    render json: {status: "Your product was successfully removed!"}
  end 
end
