class AddUserIdIndexToBattles < ActiveRecord::Migration[5.2]
  def change
    add_index :battles, :user_id
    add_index :battles, :winner_id
    add_index :battles, :loser_id
  end
end
