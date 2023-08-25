require "test_helper"

class BookingTest < ActiveSupport::TestCase
  setup do
    @booking = { user: users(:renter), passengers: 1, start_date: '2023-08-01', end_date: '2023-08-05'}
  end

  test 'a new booking is valid' do
    assert boats(:one).bookings.new(@booking).valid?
  end

  test 'a duplicate booking is invalid' do
    assert_not boats(:one).bookings.new(@booking.merge(start_date: '2023-09-01', end_date: '2023-09-05')).valid?
  end

  test 'a booking at the same time for a different boat is valid' do
    assert boats(:two).bookings.new(@booking.merge(start_date: '2023-09-01', end_date: '2023-09-05')).valid?
  end

  test 'a new booking overlapping the start of an existing booking is invalid' do
    assert_not boats(:one).bookings.new(@booking.merge(start_date: '2023-08-29', end_date: '2023-09-03')).valid?
  end

  test 'a new booking overlapping (inside) an existing booking is invalid' do
    assert_not boats(:one).bookings.new(@booking.merge(start_date: '2023-09-02', end_date: '2023-09-04')).valid?
  end

  test 'a new booking overlapping the end of an existing booking is invalid' do
    assert_not boats(:one).bookings.new(@booking.merge(start_date: '2023-09-03', end_date: '2023-09-07')).valid?
  end

  test 'a new booking overlapping (outside) an existing booking is invalid' do
    assert_not boats(:one).bookings.new(@booking.merge(start_date: '2023-08-29', end_date: '2023-10-02')).valid?
  end
end
