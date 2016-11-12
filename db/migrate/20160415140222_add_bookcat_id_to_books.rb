class AddBookcatIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :bookcat_id, :integer
  end
end
