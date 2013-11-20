class CreateTransportWays < ActiveRecord::Migration
  def change
    create_table :transport_ways do |t|
      t.string :name

      t.timestamps
    end
  end
end
