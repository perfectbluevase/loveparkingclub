class AddColumnParkings < ActiveRecord::Migration[6.1]
  def change
    add_column :parkings, :parking_prefecture, :integer, default: 0, null: false, limit: 1
  end
end
