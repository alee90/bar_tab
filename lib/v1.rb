module V1
	extend ActiveRecord::Concern

	included do
		validates :name, :presence => true, :uniqueness => true
		
end
end
