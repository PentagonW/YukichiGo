class AddType < ActiveRecord::Migration[5.2]
  def change
    add_column :abilities, :class_type, :integer
  end
end
