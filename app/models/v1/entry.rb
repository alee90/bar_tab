module V1
	class Entry < ActiveRecord::Base
		validates :entry, presence: true
		belongs_to :bar
		belongs_to :user
	end
end