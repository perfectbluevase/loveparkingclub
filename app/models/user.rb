class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Parkingのアソシエーション
  has_many :parkings, dependent: :destroy
  #PostCommentのアソシエーション
  has_many :post_comments, dependent: :destroy
  #Bookmarkのアソシエーション
  has_many :bookmarks, dependent: :destroy

  #プロフィール画像を扱うための記述
  has_one_attached :profile_image
  
  #ユーザー名は１文字以上存在
  validates :user_name, presence: true

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample_user.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  #退会済みのユーザーのログインを
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  # def update_status_destroy
    # if update(is_deleted: true)
      # parkings.destroy_all
    # end
  # end

end
