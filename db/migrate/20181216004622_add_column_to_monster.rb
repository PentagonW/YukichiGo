class AddColumnToMonster < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :level, :integer, default: 5
    add_column :monsters, :experience_value, :integer, default: 0
    add_column :monsters, :experience_value_limit, :integer, default: 1000
  end
end
