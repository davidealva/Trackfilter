class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
    	t.integer :artist_id
    	t.string :title
    	t.text :description
      t.string :credits
    	t.string :publisher_name
    	t.string :society
    	t.date :release_date

      t.timestamps null: false
    end
  end
end
