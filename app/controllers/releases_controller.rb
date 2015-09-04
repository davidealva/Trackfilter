class ReleasesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :only_current_user, except: [:index, :show]

	def index
		@releases = Release.all
	end

	def show
		@release = Release.find(params[:id])
	end

	def new
		@artist = current_user.artist
		@release = @artist.releases.build
		@track = @release.tracks.build
	end

	def create

	end

	def edit

	end

	def update

	end
	
	private
	
		def only_current_user
			@user = User.find_by_username(params[:username])
			redirect_to(root_url) unless @user == current_user
		end


end