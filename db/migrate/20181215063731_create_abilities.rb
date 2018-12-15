class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|
      t.integer :monster_id
      t.integer :strength
      t.integer :defence
      t.integer :speed
      t.integer :intelligence
      t.integer :special

      t.timestamps
    end
  end
end
