class Parking < ApplicationRecord

  #Userのアソシエーション
  belongs_to :user
  #PostCommentのアソシエーション
  has_many :post_comments, dependent: :destroy
  #Bookmarkのアソシエーション
  has_many :bookmarks, dependent: :destroy
  #PostTagのアソシエーション
  has_many :post_tags
  has_many :tags, through: :post_tags

  #ActiveStrageへの紐付け
  has_one_attached :image

  #デフォルト画像の設定
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  #既にブックマークをしているかどうかを検証
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def input_tag
    # 一番基礎的な書き方
    #tag_names = []
    #tags.each do |tag|
    #  tag_names << tag.tag_name
    #end
    #tag_names.join(",")

    # mapを使った応用的な書き方
    #tag_names = tags.map do |tag|
    #  tag.tag_name
    #end
    #tag_names.join(",")

    # 一番キレイな書き方
    tags.map(&:name).join(",")
  end

  def input_tag=(value)
    @input_tag = value
  end

  # @input_tagを使ってタグを作る処理
  def create_tags
    # "aaa,bbb" => ["aaa", "bbb"]
    input_tags = @input_tag.split(",")
    input_tags.each do |i_tag|
      tag = Tag.find_or_create_by(name: i_tag)
      post_tags.find_or_create_by(tag_id: tag.id)
    end
  end

  # @input_tagを使ってpost_tagのリレーション関係を再生成する処理
  def update_tags
    post_tags.destroy_all
    create_tags
  end
end
