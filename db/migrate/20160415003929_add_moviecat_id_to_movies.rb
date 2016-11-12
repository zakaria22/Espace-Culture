class AddMoviecatIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :moviecat_id, :integer
  end
end
