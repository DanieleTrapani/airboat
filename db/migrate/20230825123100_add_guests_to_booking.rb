class AddGuestsToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :guests, :integer
  end
end
