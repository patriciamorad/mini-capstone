class V1::OrdersController < ApplicationController
  before_action :authenticate_user
  def create

    product_id = params["product_id"] 
    product = Product.find_by(id: product_id)
    calculated_subtotal = product.price * params["quantity"].to_i 
    calculated_tax = (calculated_subtotal * 0.09)
    calculated_total = (calculated_subtotal + calculated_tax)

    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    if order.save
      render json: order.as_json 
    else 
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end

  def index
    orders = current_user.orders
    render json: orders.as_json 
  end 
end 
