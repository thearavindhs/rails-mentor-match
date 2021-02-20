class ChangeExperienceToBeStringInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :experience, :string
  end
end
