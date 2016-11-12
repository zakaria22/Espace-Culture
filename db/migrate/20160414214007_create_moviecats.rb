class CreateMoviecats < ActiveRecord::Migration
  def change
    create_table :moviecats do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
