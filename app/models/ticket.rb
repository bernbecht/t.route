class Ticket < ActiveRecord::Base
	belongs_to :transport_way
	belongs_to :company
end
