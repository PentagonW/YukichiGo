class CreateAdjectiveWords < ActiveRecord::Migration[5.2]
  def change
    create_table :adjective_words do |t|
      t.string :name
      t.integer :power

      t.timestamps
    end
  end
end
