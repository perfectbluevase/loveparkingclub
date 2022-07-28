class Tag < ApplicationRecord
  
  #PostTagのアソシエーション
  has_many :post_tags, dependent: :destroy
  has_many :parkings, through: :post_tags
  
  validates :name, presence: true
end
