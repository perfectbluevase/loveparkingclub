class RemaneTagNameColumnToTags < ActiveRecord::Migration[6.1]
  def change
    rename_column :tags, :tag_name, :name
  end
end
