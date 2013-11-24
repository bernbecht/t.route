class CreateFroms < ActiveRecord::Migration
  def change
    create_table :froms do |t|
      t.integer :city_id
      t.string :ticket_id

      t.timestamps
    end
  end
end
