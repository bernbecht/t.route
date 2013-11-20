class AddCitiesConstraints < ActiveRecord::Migration
	def change
		change_column_null :cities, :latitude, false
		change_column_null :cities, :longitude, false
		change_column_null :cities, :country_id, false
		change_column_null :cities, :name, false
	end
end
