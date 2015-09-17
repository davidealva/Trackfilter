class Profile < ActiveRecord::Base
	belongs_to :user

	has_attached_file :avatar, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "https://s3-us-west-2.amazonaws.com/trackfilter/default/default_:style.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
