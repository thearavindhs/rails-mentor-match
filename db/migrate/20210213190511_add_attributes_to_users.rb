class AddAttributesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role_preference, :string
    add_column :users, :industry_preference, :string
    add_column :users, :experience_preference, :string
  end
end
