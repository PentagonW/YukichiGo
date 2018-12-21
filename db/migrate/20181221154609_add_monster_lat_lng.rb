class AddMonsterLatLng < ActiveRecord::Migration[5.2]
  def change
    add_column :monsters, :longitude, :float
    add_column :monsters, :latitude, :float
    add_column :monsters, :country, :string
    add_column :monsters, :city, :string
    add_column :monsters, :address, :string
  end
end
