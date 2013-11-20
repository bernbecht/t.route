class ChangeColumnNullCountry < ActiveRecord::Migration
  def change
  	change_column_null :countries, :name, false
  end
end
