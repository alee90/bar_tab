class Bar < ActiveRecord::Base
	validates :name, presence: true

	has_many :entries
	accepts_nested_attributes_for :entries

	belongs_to :user
end