class Entry < ActiveRecord::Base
	# validates :entry, presence: true
	validates :entry, presence: true, :numericality => {:greater_than => 0}
	belongs_to :bar
	belongs_to :user
end
