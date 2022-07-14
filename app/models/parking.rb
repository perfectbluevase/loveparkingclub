class Parking < ApplicationRecord
  
  #ActiveStrageへの紐付け
  has_one_attached :image
  
  #Userのアソシエーション
  belongs_to :user
  #PostCommentのアソシエーション
  has_many :post_comments, dependent: :destroy
  #Bookmarkのアソシエーション
  has_many :bookmarks, dependent: :destroy
  #PostTagのアソシエーション
  has_many :post_tags
  
end
