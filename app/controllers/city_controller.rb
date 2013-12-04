class CityController < ApplicationController
	def autocomplete

		@query = params[:query]
		@query_capital = @query.capitalize
		@query_downcase = @query.downcase
		@cities = City.where("name LIKE ? OR name LIKE ?
			OR name LIKE ?", 
			"#{@query}%",
			"#{@query_capital}%",
			"#{@query_downcase}%")
		
		if @cities.length > 0
			@citiesList = @cities.map do |u|
				{
					id:u.id, 
					name:u.name,
					latitude: u.latitude,
					longitude: u.longitude,
					country: u.country.name
				}
			end


			respond_to do |format|
				format.json{ render :json => @citiesList }
			end
		else
			respond_to do |format|
				format.text{ render :text => "null" }
			end
		end
	end
end
