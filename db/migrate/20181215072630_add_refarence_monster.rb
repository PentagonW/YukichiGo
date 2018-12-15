class AddRefarenceMonster < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :user_id, :integer
    change_column :monsters, :user_id, :integer, null: false
    add_column :monsters, :created_at, :datetime
    change_column :monsters, :created_at, :integer, null: false
    add_column :monsters, :updated_at, :datetime
    change_column :monsters, :updated_at, :integer, null: false
  end
end
