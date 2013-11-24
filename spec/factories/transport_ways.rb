require 'faker'
require 'factory_girl_rails'

FactoryGirl.define do 
	factory(:transport_way) do
		name {Faker::Name.name}
	end
end