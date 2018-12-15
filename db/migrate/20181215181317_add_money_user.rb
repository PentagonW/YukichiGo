class AddMoneyUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :money, :integer, default: 100
  end
end
