class Bar < ActiveRecord::Base
	# validates :name, uniqueness: true
	validates_uniqueness_of :name, :scope => :user_id

	has_many :entries
	accepts_nested_attributes_for :entries

	belongs_to :user

	before_save do
    	self.name = self.name.to_s.split(',').first
  end
end