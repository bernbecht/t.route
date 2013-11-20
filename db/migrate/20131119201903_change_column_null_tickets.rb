class ChangeColumnNullTickets < ActiveRecord::Migration
	def change
		change_column_null :tickets, :number, false
		change_column_null :tickets, :date, false
		change_column_null :tickets, :time, false
		change_column_null :tickets, :duration, false
		change_column_null :tickets, :company_id, false
		change_column_null :tickets, :transport_way_id, false

	end
end
