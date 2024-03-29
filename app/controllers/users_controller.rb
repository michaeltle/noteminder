class UsersController < ApplicationController
	def index
		@users = User.all
	end


	def new
		@user = User.new
		@user.decks.build
	end

	def create
		@user = User.new(user_params)
		
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end


	end

	private

		def user_params
			params.require(:user).permit(:email, :phone, decks_attributes: [:title])
		end
end