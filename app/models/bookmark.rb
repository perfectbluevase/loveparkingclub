class Bookmark < ApplicationRecord
  
  #Userのアソシエーション
  belongs_to :user
  #Parkingのアソシエーション
  belongs_to :parking
  
  #重複登録を防ぐ記述
  validates :user_id, uniqueness: { scope: :parking_id }
  
end
