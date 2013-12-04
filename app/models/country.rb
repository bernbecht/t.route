class Country < ActiveRecord::Base
	before_create :downcase
	before_save :downcase

	has_many :cities
	validates :name, presence: true, length:{maximum: 50, minimum: 2}

	private
	def downcase
		self.name = self.name.downcase.to_s
	end
end
