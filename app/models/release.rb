class Release < ActiveRecord::Base
	belongs_to :artist
	has_many :tracks

	has_attached_file :cover, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default_:style.png" 
	validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
end
