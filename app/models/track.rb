class Track < ActiveRecord::Base
	belongs_to :release
	has_one :upload
end
