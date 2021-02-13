class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.references :mentor, null: false, foreign_key: {to_table: :users}
      t.references :mentee, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
