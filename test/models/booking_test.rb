require "test_helper"

class BookingTest < ActiveSupport::TestCase
# the start date before and the end date after the new start_date -> not available
# the start date before and the end date after the new end_date  -> not available
# the start date and end date between the new start and end dates -> not available
# the start date before and the end date after the new start and end date -> not available

  test 'two' do
    assert_not boats(:one).bookings.new(user: users(:callum), start_date: '2023-09-01', end_date: '2023-09-05').valid?
  end
  test "a booking spans the start data" do
    # assert_not Booking.available_between?('2023-09-01', '2023-09-03')
    assert_not boats(:one).bookings.new(user: users(:callum), start_date: '2023-09-01', end_date: '2023-09-03').valid?
  end
  test 'three' do
    # assert_not Booking.available_between?('2023-09-02', '2023-09-04')
    assert_not boats(:one).bookings.new(user: users(:callum), start_date: '2023-09-02', end_date: '2023-09-04').valid?
  end
  test 'four' do
    # assert_not Booking.available_between?('2023-09-03', '2023-09-05')
    assert_not boats(:one).bookings.new(user: users(:callum), start_date: '2023-09-03', end_date: '2023-09-05').valid?
  end
end
