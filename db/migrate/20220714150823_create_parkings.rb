class CreateParkings < ActiveRecord::Migration[6.1]
  def change
    create_table :parkings do |t|
      t.string :parking_name
      t.string :parking_address
      t.string :parking_operator
      t.string :parking_fee_info
      t.string :parking_review
      t.timestamps
    end
  end
end
