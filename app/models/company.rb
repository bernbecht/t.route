class Company < ActiveRecord::Base
	has_many :tickets
	validates :name, presence: true, length:{maximum: 50, minimum: 2}
end
