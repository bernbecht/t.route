require 'faker'
require 'factory_girl_rails'

FactoryGirl.define do
	factory :country do
		name {Faker::Name.name}
	end	
end