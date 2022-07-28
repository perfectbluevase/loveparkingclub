class PostTag < ApplicationRecord
  
  #Parkingのアソシエーション
  belongs_to :parking
  #Tagのアソシエーション
  belongs_to :tag
  
  
end
