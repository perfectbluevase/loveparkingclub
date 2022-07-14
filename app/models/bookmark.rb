class Bookmark < ApplicationRecord
  
  #Userのアソシエーション
  belongs_to :user
  #Parkingのアソシエーション
  belongs_to :parking
  
end
