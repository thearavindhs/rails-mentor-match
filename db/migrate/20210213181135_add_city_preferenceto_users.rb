class AddCityPreferencetoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :city_preference, :string
    add_column :users, :country_preference, :string
    add_column :users, :gender_preference, :string
    add_column :users, :language_preference, :string
  end
end
