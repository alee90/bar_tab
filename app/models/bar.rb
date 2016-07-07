class Bar < ActiveRecord::Base
	validates :name, presence: true
	validates :total, presence: true

	belongs_to :user
end