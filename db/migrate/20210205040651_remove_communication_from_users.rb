class RemoveCommunicationFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :communication, :string
  end
end
