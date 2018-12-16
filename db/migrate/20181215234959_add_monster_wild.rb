class AddMonsterWild < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :ecology, :integer, default: 0
    change_column :monsters, :user_id, :integer, null: true
  end
end
