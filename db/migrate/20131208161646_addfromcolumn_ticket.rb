class AddfromcolumnTicket < ActiveRecord::Migration
	def change
		add_column :tickets, :from_city_id, :integer
	end
end
