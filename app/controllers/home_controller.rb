class HomeController < ApplicationController
	before_action :authenticate_user!, only: :secure

	def index
		if current_user
			puts "I'm logged in as #{current_user.email}"
			redirect_to '/secure'
		else 
			puts "I'm not logged in"
		end
	end

	def home
		id = current_user.id
		user = User.find(id)

		puts "============"
		p user
		puts "============"
	end

end