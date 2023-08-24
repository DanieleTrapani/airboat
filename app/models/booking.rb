class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :boat_available

  def boat_available
    if Booking.where(start_date: (start_date...end_date))
              .or(Booking.where(end_date: (start_date..end_date)))
              .or(Booking.where("start_date < ? AND end_date > ?", start_date, end_date)).any?
      errors.add(:booking, "dates not available")
    end
    # errors.add(:start_date, "not available") if Booking.where(start_date: (start_date..end_date)).any?
    # errors.add(:end_date, "not available") if Booking.where(end_date: (start_date..end_date)).any?
    # return unless Booking.where("start_date < ? AND end_date > ?", start_date, end_date).any?

    # errors.add(:start_date, "booked")
    # errors.add(:end_date, "booked")
  end
end
