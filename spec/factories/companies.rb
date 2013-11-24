require 'faker'
require 'factory_girl_rails'

FactoryGirl.define do 
	factory :company do
		name {Faker::Name.name}
	end
end