class CreateTos < ActiveRecord::Migration
  def change
    create_table :tos do |t|
      t.integer :city_id
      t.string :ticket_id

      t.timestamps
    end
  end
end
