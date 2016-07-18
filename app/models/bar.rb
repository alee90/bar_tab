class Bar < ActiveRecord::Base
	include V1
	# validates :name, presence: true, uniqueness: true
	validates_uniqueness_of :name, :scope => :user_id

	has_many :entries
	accepts_nested_attributes_for :entries

	belongs_to :user

	validate :check_bar_unique, :on => :create

  def check_bar_unique
    if Bar.where(:name => self.name)
        errors.add(:base, :duplicate)
        return false
    end
  end

	before_save do
    	self.name = self.name.to_s.split(',').first
  end
end