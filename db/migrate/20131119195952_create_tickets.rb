class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :number
      t.date :date
      t.time :time
      t.time :duration
      t.integer :company_id
      t.integer :transport_way_id

      t.timestamps
    end
  end
end
