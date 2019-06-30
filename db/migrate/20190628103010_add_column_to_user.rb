class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :date, :date
    add_column :users, :gender, :string
  end
end
