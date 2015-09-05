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
		@release = @artist.releases.new #add params to build
		@release.tracks.build #add params to build and save, nested form 
	end

	def create
		@release.save # do save with params
	end

	def edit

	end

	def update

	end
	
	private
		def release_params
			params.require(:release).permit(:title, :description, :price, :credits, :publisher_name, :society, :release_date, :cover, 
				tracks_attributes: [:id, :title, :remixer, :price])
		end

		def only_current_user
			@user = User.find_by_username(params[:username])
			redirect_to(root_url) unless @user == current_user
		end


end