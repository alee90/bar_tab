class BarsController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy, :search]
	before_action :show_bar, only: [:show, :edit, :update, :destroy, :remove_bar]

	# require 'yelp'

	# client = Yelp::Client.new({ consumer_key: Rails.application.secrets.yelp_consumer_key,
 #                            	consumer_secret: Rails.application.secrets.yelp_consumer_secret,
 #                            	token: Rails.application.secrets.yelp_token,
 #                            	token_secret: Rails.application.secrets.yelp_token_secret
 #                          	})
	# def search
	# 	parameters = { name: params[:name], limit: 16 }
	# 	render json: Yelp.client.search(:name, parameters)
	# end

	def index
		@user = User.find(params[:user_id])
		@bars = @user.bars
		@totals = session[:total]
		# @bar = Bar.find(params[:bar_id])
	end

	def new
		@user = User.find(params[:user_id])
		@bar = Bar.new
		@api_call = session[:z]
	end

	def create
		@user = User.find(params[:user_id])
		@bar = Bar.new(bar_params)
		if @bar.save
			@bar.name.split(',').first
			@user.bars << @bar
			redirect_to new_user_bar_entry_path(:bar_id => @bar.id)
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

	def remove_bar
		user = User.find(params[:user_id])
		user.bars.delete(@bar)
		redirect_to user_bars_path
	end


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