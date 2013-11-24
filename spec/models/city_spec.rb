require 'spec_helper'

describe 'City' do
	before{ @city = FactoryGirl.build(:city)}
	subject{@city}

	describe '#initialize' do
		describe 'must has a valid Factory' do
			it{should be_valid}
		end
		describe 'must respond to' do
			it{should respond_to(:name)}
			it{should respond_to(:longitude)}
			it{should respond_to(:latitude)}
			it{should respond_to(:country_id)}
		end
	end

	describe 'must has a valide name' do
		context 'without nil name' do
			it do
				@city.name = nil
				should_not be_valid
			end
		end
		context 'without name bigger than 50 char' do
			it do
				51.times{@city.name+='b'}
				should_not be_valid
			end
		end
		context 'without name smaller than 2 char' do
			it do
				@city.name = '1'
				should_not be_valid
			end
		end
	end

	describe 'must has a valid latitude' do
		context 'without non float number' do
			it do
				@city.latitude = 'A'
				should_not be_valid
			end
		end
		context 'without precision bigger than 6' do
			it do
				@city.latitude = 11.1234567
				should_not be_valid
			end
		end
		context 'without scale bigger than 2' do
			it do
				@city.latitude = 123.1234567
				should_not be_valid
			end
		end
		context 'without being bigger than 85' do
			it do
				@city.latitude = 86.1234567
				should_not be_valid
			end
		end
		context 'without being bigger than -85' do
			it do
				@city.latitude = -86.1234567
				should_not be_valid
			end
		end
	end

	describe 'must has a valid longitude' do
		context 'without non float number' do
			it do
				@city.latitude = 'A'
				should_not be_valid
			end
		end
		context 'without precision bigger than 6' do
			it do
				@city.latitude = 11.1234567
				should_not be_valid
			end
		end
		context 'without scale bigger than 3' do
			it do
				@city.latitude = 123.1234567
				should_not be_valid
			end
		end
		context 'without being bigger than 180' do
			it do
				@city.latitude = 186.1234567
				should_not be_valid
			end
		end
		context 'without being bigger than -180' do
			it do
				@city.latitude = -186.1234567
				should_not be_valid
			end
		end
	end


end
