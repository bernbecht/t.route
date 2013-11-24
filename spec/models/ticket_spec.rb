require 'spec_helper'

describe 'Ticket' do
	before {@ticket = FactoryGirl.build(:ticket)}
	subject{@ticket}

	describe '#initialize' do
		describe 'must has a valid Factory' do
			it{should be_valid}
		end
		describe 'must respond to' do
			it{should respond_to(:number)}
			it{should respond_to(:date)}
			it{should respond_to(:time)}
			it{should respond_to(:duration)}
			it{should respond_to(:company_id)}
			it{should respond_to(:transport_way_id)}
		end

		describe 'must has a valid number' do
			context 'without NIL' do
				it do
					@ticket.number = nil
					should_not be_valid
				end
			end
			context 'without special char' do
				it do
					@ticket.number = "AZ190$aasd#{}"
					should_not be_valid
				end
			end
		end

		describe 'must has a valid date' do
			context 'without NIL' do
				it do
					@ticket.date = nil
					should_not be_valid
				end
			end
			context 'without wrong day' do
				it do
					@ticket.date = "40-12-2010"
					should_not be_valid
				end
			end
			context 'without bad month' do
				it do
					@ticket.date = "10-13-2010"
					should_not be_valid
				end
			end
			context 'without year before 2013' do
				it do
					@ticket.date = "10-12-2010"
					should_not be_valid
				end
			end
		end

		describe 'must has a valid time' do
			context 'without NIL' do
				it do
					@ticket.time = nil
					should_not be_valid
				end
			end
			context 'without bad hour' do
				it do
					@ticket.time = "10-12-2010 25:00:00"
					should_not be_valid
				end
			end
			context 'without bad minute' do
				it do
					@ticket.time = "10-12-2010 24:70:00"
					should_not be_valid
				end
			end
			context 'without bad second' do
				it do
					@ticket.time = "10-12-2010 24:00:70"
					should_not be_valid
				end
			end
		end

		describe 'must has a valid company' do
			it do
				@ticket.company_id = nil
				should_not be_valid
			end
		end

			describe 'must has a valid transport_way_id' do
			it do
				@ticket.transport_way_id = nil
				should_not be_valid
			end
		end

		

	end
end
