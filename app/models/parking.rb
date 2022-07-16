class Parking < ApplicationRecord
  
  #ActiveStrageへの紐付け
  has_one_attached :image
  
  #デフォルト画像の設定
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  #Userのアソシエーション
  belongs_to :user
  #PostCommentのアソシエーション
  has_many :post_comments, dependent: :destroy
  #Bookmarkのアソシエーション
  has_many :bookmarks, dependent: :destroy
  #PostTagのアソシエーション
  has_many :post_tags
  
end
