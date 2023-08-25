class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :boat_available

  def boat_available
    errors.add(:start_date, "not available") if Booking.where(start_date: (start_date..end_date))
    errors.add(:end_date, "not available") if Booking.where(end_date: (start_date..end_date))
    return unless Booking.where("start_date < ? AND end_date > ?", start_date, end_date)

    errors.add(:base, "fully booked for these dates")
  end
end
