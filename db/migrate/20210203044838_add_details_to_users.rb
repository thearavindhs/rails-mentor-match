class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :gender, :string
    add_column :users, :role, :string
    add_column :users, :industry, :string
    add_column :users, :language, :string
    add_column :users, :communication, :string
    add_column :users, :experience, :integer
    add_column :users, :user_type, :string
    add_column :users, :maximum_mentee, :integer
  end
end
