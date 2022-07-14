class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #Parkingのアソシエーション
  has_many :parkings, dependent: :destory
  #PostCommentのアソシエーション
  has_many :post_comments, dependent: :destroy
  #Bookmarkのアソシエーション
  has_many :bookmarks, dependent: :destroy
         
end
