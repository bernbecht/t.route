class AddTableTicket < ActiveRecord::Migration
  def change
  	 add_column :tickets, :to_city_id, :integer
  end
end
