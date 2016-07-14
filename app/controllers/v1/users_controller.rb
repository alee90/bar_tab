module V1
	class UsersController < ApplicationController
		before_action :authenticate_user!, only: :show
		before_action :show_user, only: [:show, :edit, :update, :destroy]
		def show
			puts '======='
			puts params
			puts '======='
		end

		private

		def show_user
			@user = User.find(params[:id])
		end
	end
end

