class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :birthday, :date
    add_column :users, :about, :text
    add_column :users, :average_movies, :string
    add_column :users, :read_more, :boolean, null: false, default: false
  end
end
