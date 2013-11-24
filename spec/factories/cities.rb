require 'faker'
require 'factory_girl_rails'

FactoryGirl.define do 
	factory:city do
		name {Faker::Name.name}
		latitude 85.000000
		longitude -180.000000
		country_id 1
	end
end