class Monster < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.string :serial_number, null: false
      t.integer :power, null: false
    end
  end
end
