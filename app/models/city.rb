class City < ActiveRecord::Base
	belongs_to :country
	has_many :tickets
	

	validates :name, presence: true, length:{maximum: 50, minimum: 2}
	validates :latitude, presence: true
	validates :latitude, :format => { :with => /\A(\+|\-)*\d{1,2}\.\d{1,6}\Z/i }, 
	:numericality => {:greater_than => -86.999999, :less_than => 85.000001}
	validates :longitude, :format => { :with => /\A(\+|\-)*\d{1,3}\.\d{1,6}\Z/i }, 
	:numericality => {:greater_than => -181.999999, :less_than => 180.000001}


	before_create :downcase
	before_save :downcase
	private
	def downcase
		self.name = self.name.downcase.to_s
	end
	

end
