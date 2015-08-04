class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer :user_id
    	t.string :profile_name
    	t.string :first_name
    	t.string :last_name
    	t.string :city
    	t.string :country
    	t.string :genre
    	t.text :bio 
    	t.string :manager
    	t.string :manager_email
    	t.string :manager_phone


      t.timestamps null: false
    end
  end
end
