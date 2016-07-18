module V1
	class UsersController < ApplicationController
		before_action :authenticate_user!, only: :show
		before_action :show_user, only: [:show, :edit, :update, :destroy]
		def show
			puts '======='
			puts params
			puts '======='
		end
		def generate_new_password_email 
			user = User.find(params[:user_id]) 
			user.send_reset_password_instructions flash[:notice] = "Reset password instructions have been sent to #{user.email}." 
			redirect_to user_path(user) 
		end
		private

		def show_user
			@user = User.find(params[:id])
		end
	end
end

