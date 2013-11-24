require 'spec_helper'

describe 'TransportWay' do
	before do
		@transport = FactoryGirl.build(:transport_way)
	end

	subject {@transport}

	context 'when #initialize' do	
		describe 'it has a valid factory' do
			it{should be_valid}
		end
		describe 'it has to respond to' do
			it{should respond_to(:name)}
			it{should respond_to(:id)}
		end
	end
	describe 'must has a valid name' do
		context 'not nil' do
			it do
				@transport.name = nil
				should_not be_valid
			end
		end
		context 'not bigger than 51 char' do
			it do
				51.times{@transport.name+='b'}
				should_not be_valid
			end
		end
		context 'not smaller than 2 char' do
			it do
				@transport.name = '1'
				should_not be_valid
			end
		end	
	end
end
