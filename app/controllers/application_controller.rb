class ApplicationController < ActionController::Base
  	protect_from_forgery with: :exception

  	def check_signed_in
  		@user = current_user
  		redirect_to @user if signed_in?
	end

	def after_sign_in_path_for(resource) 
		@user=current_user 
	end
end
