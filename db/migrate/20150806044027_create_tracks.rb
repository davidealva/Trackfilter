class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
    	t.integer :release_id
    	t.string :title
    	t.string :remixer

      t.timestamps null: false
    end
  end
end
