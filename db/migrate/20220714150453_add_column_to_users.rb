class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :age_type, :integer
    add_column :users, :living_prefecture, :string
    add_column :users, :biography, :string
    add_column :users, :is_deleted?, :boolean
  end
end
