class Artist < ActiveRecord::Base
	belongs_to :user
	has_many :releases
	has_many :tracks, through: :releases 

end
