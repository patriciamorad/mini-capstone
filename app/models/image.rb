class Image < ApplicationRecord
  def images
    Image.where(id: self.id)
  end 

  def as_json 
    {
      id: id,
      images: image_url,
    }
  end  

end
