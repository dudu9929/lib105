class AddBuildingToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :building, :string
  end
end
