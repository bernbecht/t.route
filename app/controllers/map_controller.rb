require 'json'

class MapController < ApplicationController
	def search
		@cities = params[:json]
		@array = JSON.parse(@cities)
		@array_tickets = []
		@array.each_with_index do |a,index|
			if(index > 0)
				@country_from = Country.find_by(name: @array[index-1]['country'])
				@from = City.find_by(name: @array[index-1]['city'], 
					country_id: @country_from.id)
				

				@country_to = Country.find_by(name: @array[index]['country'])
				@to = City.find_by(name: @array[index]['city'], 
					country_id: @country_to.id)

				if @array[index]['date'].empty?
					@array[index]['date'] = nil
				end

				@ticket = Ticket.where("date = ? AND from_city_id = ? AND to_city_id = ?",
					@array[index]['date'], @from.id, @to.id ).first

				if !(@ticket.blank?)
					@array_tickets << @ticket
				end

			end
		end

		if (@array_tickets.length > 0)
			render partial: "map/tickets_description"
		else
			respond_to do |format|
				format.text{ render :text => "null" }
			end
		end

		# render partial: "map/tickets_description"
		# respond_to do |format|
		# 	format.text{ render :text => @array_tickets.length}
		# end
	end

	def ticket_search
	end
end

