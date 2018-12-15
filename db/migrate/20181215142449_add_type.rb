class AddType < ActiveRecord::Migration[5.2]
  def change
    add_column :abilities, :type, :integer
  end
end
