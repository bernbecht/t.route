class Country < ActiveRecord::Base
	has_many :cities
	validates :name, presence: true, length:{maximum: 50, minimum: 2}
end
