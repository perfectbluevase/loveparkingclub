class AddColumnsToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :user_id, :integer
    add_column :post_comments, :parking_id, :integer
    add_column :bookmarks, :user_id, :integer
    add_column :bookmarks, :parking_id, :integer
    add_column :post_tags, :tag_id, :integer
    add_column :post_tags, :parking_id, :integer
    add_column :tags, :post_tag_id, :integer
  end
end
