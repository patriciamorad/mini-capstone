class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :orders, through: :carted_products
  belongs_to :supplier
  has_many :carted_products
  has_many :images 

  def supplier
    Supplier.find_by(id: self.supplier_id)
  end

  def image
    Image.find_by(id: self.id)
  end

  def is_discounted
    if price.to_i < 100
      return true 
    else 
      return false 
    end
  end 

  def tax
    product_tax = (price.to_i * 0.09)
    return product_tax
  end 

  def total 
    total_amount = (price.to_i * 1.09)
    return total_amount
  end

  def as_json
    {
      id: id,
      name: name,
      price: price,
      is_discounted: is_discounted,
      tax: tax,
      total: total,
      image_url: image.as_json,
      description: description,
      supplier: supplier.as_json, 
      created_at: created_at, 
      updated_at: updated_at,
      active: active
      
    }
  end  
end
