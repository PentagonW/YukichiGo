class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.integer :user_id
      t.integer :winner_id
      t.integer :loser_id

      t.timestamps
    end
  end
end
