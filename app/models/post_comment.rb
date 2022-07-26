class PostComment < ApplicationRecord
  
  #Userのアソシエーション
  belongs_to :user
  #Parkingのアソシエーション
  belongs_to :parking
  
  validates :comment, presence: true
  
end
