class AddRefarenceMonster < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :user_id, :integer, null: false
    add_column :monsters, :created_at, :datetime, null: false
    add_column :monsters, :updated_at, :datetime, null: false
  end
end
