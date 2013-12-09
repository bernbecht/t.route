class DropToTable < ActiveRecord::Migration
  def change
  	drop_table :tos
  end
end
