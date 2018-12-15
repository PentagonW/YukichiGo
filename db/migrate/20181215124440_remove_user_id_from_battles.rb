class RemoveUserIdFromBattles < ActiveRecord::Migration[5.2]
  def change
    remove_column :battles, :user_id, :integer
  end
end
