class EntriesController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
	before_action :show_entry, only: [:show, :edit, :update, :destroy]

	def index
		@user = User.find(params[:user_id])
		@bar = Bar.find(params[:bar_id])
		@entries = Entry.all
		total = 0
		# def x 
		# 	@bar. entries.each do |entry|
		# 		total = total + entry.entry.round(2).to_f
		# 		print total
		# 	end
		# end
	end
	def show
		@entries = Entry.all
	end

	def new
		@user = User.find(params[:user_id])
		@bar = Bar.find(params[:bar_id])
		@entry = Entry.new
	end

	def create
		@user = User.find(params[:user_id])
		@bar = Bar.find(params[:bar_id])
		@entry = Entry.new(entry_params)

		if @entry.save
			@bar.entries << @entry
			redirect_to user_bar_entries_url
		else
			render :root
		end
	end

	def edit
	end

	def update
		if @entry.update(entry_params)
			redirect_to @entry
		else
			render :edit
		end
	end

	def destroy
		@entry.destroy
		redirect_to users_url
	end


	# PRIVATE METHODS
	private

	def show_bar
		@bar = Bar.find(params[:id])
	end

	def show_entry
		@entry = Entry.find(params[:id])
	end

	def bar_params
		params.require(:bar).permit(:name, :users)
	end

	def entry_params
		params.require(:entry).permit(:entry, :bars, :users)
	end

end