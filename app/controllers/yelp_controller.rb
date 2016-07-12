class YelpController < ApplicationController
	require 'yelp'
	require 'json'

	client = Yelp::Client.new({ consumer_key: Rails.application.secrets.yelp_consumer_key,
                            	consumer_secret: Rails.application.secrets.yelp_consumer_secret,
                            	token: Rails.application.secrets.yelp_token,
                            	token_secret: Rails.application.secrets.yelp_token_secret
                          	})
	def show

	end
  	def search
  		puts "herro"
  		client = Yelp::Client.new({ consumer_key: Rails.application.secrets.yelp_consumer_key,
				                	consumer_secret: Rails.application.secrets.yelp_consumer_secret,
				                	token: Rails.application.secrets.yelp_token,
				                	token_secret: Rails.application.secrets.yelp_token_secret
				              	})
  	data = params[:data]
  	@x = client.business(data)
  	p @x
  	@y = @x.to_json.html_safe
  	@z = @x.business.name
  	session[:z] = @z
  	# respond_to do |format|
  	# 	format.json {render json: @x}
  	# end
	# @y = @x.business.name



	end

end
# 	def search
# 		uri ="http://elections.huffingtonpost.com/pollster/api/polls.json?topic=2016-president"
# 	   	response = HTTParty.get(uri) 
# 	    puts response
# 	end
# end