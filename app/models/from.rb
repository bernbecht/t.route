class From < ActiveRecord::Base
	belongs_to :city
	belongs_to :ticket
end
