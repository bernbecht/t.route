class MapController < ApplicationController
	def autocomplete
		@query = Country.find_by(name: params[:query])
		

		# @cities_array = []
		# @query.each do |c|
		# 	@cities_array << c.name
		# end

		respond_to do |format|
			format.text{ render :text => @query.name}
		end
	end
end

