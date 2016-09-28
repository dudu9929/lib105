class AddSizeToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :size, :string
  end
end
