class Bar < ActiveRecord::Base
	include V1
	# validates :name, presence: true
	#setting uniqueness validators
	validates_uniqueness_of :name, :scope => :user_id

	has_many :entries
	accepts_nested_attributes_for :entries

	belongs_to :user

	validate :check_unique, :on => :create

	# before_create :check_unique

	#attempt to check uniqueness of bar name before create to make sure previous name wasn't saved in db... not working as expected..
 	def check_unique
    bar = Bar.where(:name => self.name, :user_id => self.user_id)
    if bar != nil
    	return false
    end
  end

  #split string on save to not include address given by google autocomplete
	before_save do
    	self.name = self.name.to_s.split(',').first
  end
end