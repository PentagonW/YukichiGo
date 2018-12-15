class AddMainMonster < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :main_monster_id, :integer
  end
end
