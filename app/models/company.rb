class Company < ActiveRecord::Base
	has_many :tickets
	validates :name, presence: true, length:{maximum: 50, minimum: 2}

	before_create :downcase
	before_save :downcase
	private
	def downcase
		self.name = self.name.downcase.to_s
	end
end
