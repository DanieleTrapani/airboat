class AddImgToBoatModel < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :img_url, :string
  end
end
