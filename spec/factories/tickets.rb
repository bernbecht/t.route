require 'faker'
require 'factory_girl_rails'

FactoryGirl.define do
	factory :ticket do
		number {Faker::Number.number(6)}
		date  Date.new(2014, 11, 10).to_formatted_s(:db)    
		time Time.new(2014, 11, 10, 22, 35, 0)
		duration Time.new(2014, 11, 10, 1, 35, 0)
		company_id 1
		transport_way_id 1
	end
end