class BarsController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
	before_action :show_bar, only: [:show, :edit, :update, :destroy]
	def index
		@user = User.find(params[:user_id])
		@bars = @user.bars
	end

	def show
		
	end

	def new
		@user = User.find(params[:user_id])
		@bar = Bar.new
	end

	def create
		user = User.find(params[:user_id])
		@bar = Bar.new(bar_params)

		if @bar.save
			user.bars << @bar
			redirect_to bar_url
		else
			render :root
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
		@bar.destroy
		redirect_to users_url
	end


	# PRIVATE METHODS
	private

	def show_bar
		@bar = Bar.find(params[:id])
	end

	def bar_params
		params.require(:bar).permit(:name, :total, :users)
	end

end