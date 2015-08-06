class ProfilesController < ApplicationController
	before_action :authenticate_user!
	before_action :only_current_user

	def new
		redirect_to artist_path(current_user)
	end

	def edit
		@user = User.find(params[:user_id])
		@profile = @user.profile
		@artist = @user.artist
	end

	def update
		@user = User.find(params[:user_id])
		@profile = @user.profile 
		@artist = @user.artist
		if @profile.update_attributes(profile_params) && @artist.update_attributes(artist_params)
			flash[:success] = "Your profile has been updated"
			redirect_to static_artist_path(current_user)
		else
			render action: :edit
		end
	end


	private
		def profile_params
			params.require(:profile).permit(:first_name, :last_name, :city, :country, :genre, :bio, :manager, :manager_email, :manager_phone, :avatar)
		end

		def artist_params
			params.require(:artist).permit(:artist_name)
		end

		def only_current_user
			@user = User.find(params[:user_id])
			redirect_to(root_url) unless @user == current_user
		end

end