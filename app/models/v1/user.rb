module V1
	class User < ActiveRecord::Base
	  # Include default devise modules. Others available are:
	  # :confirmable, :lockable, :timeoutable and :omniauthable
	  devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :trackable, :validatable

	  has_many :bars
	  has_many :entries, through: :bars
	end
end