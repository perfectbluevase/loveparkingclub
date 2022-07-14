class Tag < ApplicationRecord
  
  #PostTagのアソシエーション
  has_many :post_tags, dependent: :destroy
  
end
