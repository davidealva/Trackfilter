class Release < ActiveRecord::Base
	belongs_to :artist
	has_many :tracks

	accepts_nested_attributes_for :tracks, reject_if: :all_blank, allow_destroy: true

	has_attached_file :cover, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/default_:style.png" 
	validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
end
