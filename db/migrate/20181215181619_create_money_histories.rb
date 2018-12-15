class CreateMoneyHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :money_histories do |t|
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
