class ArtistsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :only_current_user, except: [:index, :show]

	def index
		@artists = User.all
	end

	def show
		@artist = User.find_by_username(params[:username])
	end


	private
	
		def only_current_user
			@user = User.find(params[:user_id])
			redirect_to(root_url) unless @user == current_user
		end
		
end
