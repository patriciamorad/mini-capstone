class V1::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def create
    carted_products = current_user.carted_products.where(status: "carted")
    calculated_subtotal  = 0 
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    end 
    calculated_tax = (calculated_subtotal * 0.09)
    calculated_total = (calculated_subtotal + calculated_tax)

    order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    order.save
    carted_products.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = order.id 
      carted_product.save
    end 
    render json: order.as_json
  end 

  def index
    orders = current_user.orders
    render json: orders.as_json 
  end 
end
