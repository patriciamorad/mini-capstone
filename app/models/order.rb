class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products



  # def image
  #   Image.find_by(id: self.id)
  # end

  # def subtotal 
  #   total_amount = (price.to_i * )
  #   subtotal_amount = (total_amount * 1.09)
  #   return subtotal_amount
  # end

  # def tax
  #   order_tax = (price.to_i * 0.09)
  #   return order_tax
  # end 

  def as_json 
    {
      id: id,
      tax: tax,
      subtotal: subtotal,
      total: total  
    }
  end 
  
end
