module V1
	class BarsController < ApplicationController
		before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy, :search]
		before_action :show_bar, only: [:show, :edit, :update, :destroy, :remove_bar]

		def index
			@user = User.find(params[:user_id])
			@bars = @user.bars
			# @bar = Bar.find(params[:bar_id])
		end

		def new
			@user = User.find(params[:user_id])
			@bar = Bar.new
		end

		def create
			@user = User.find(params[:user_id])
			@bar = Bar.new(bar_params)
			if @bar.save
				# @bar.name.split(',').first
				@user.bars << @bar
				redirect_to new_user_bar_entry_path(:bar_id => @bar.id)
			else
				flash.now[:duplicate] = "Bar already saved.  Try another"
				render :new
			end
		end

		def edit
		end

		def update
			if @bar.update(bar_params)
				redirect_to @bar
			else
				render :edit
			end
		end

		def destroy
			@user = User.find(params[:user_id])
			@bar = Bar.find(params[:id])
			@bar.destroy
			redirect_to user_path(@user)
		end

		# def remove_bar
		# 	user = User.find(params[:user_id])
		# 	user.bars.delete(@bar)
		# 	redirect_to user_bars_path
		# end


		# PRIVATE METHODS
		private

		def show_bar
			@bar = Bar.find(params[:id])
		end

		def bar_params
			params.require(:bar).permit(:name)
		end

		def entry_params
			params.require(:entry).permit(:entry, :bars, :users)
		end
	end
end