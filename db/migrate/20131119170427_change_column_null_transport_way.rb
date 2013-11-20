class ChangeColumnNullTransportWay < ActiveRecord::Migration
  def change
  	change_column_null :transport_ways, :name, false
  end
end
