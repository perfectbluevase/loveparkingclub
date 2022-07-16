class AddUsserIdToParkings < ActiveRecord::Migration[6.1]
  def change
    add_column :parkings, :user_id, :integer
  end
end
