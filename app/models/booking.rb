class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date, message: "must be after the start date." }
  validates :passengers, presence: true, numericality: { only_integer: true }
  validate :boat_available, if: -> { start_date.present? || end_date.present? }

  def boat_available
    errors.add(:start_date, "not available") if boat.bookings.where(start_date: (start_date..end_date)).exists?
    errors.add(:end_date, "not available") if boat.bookings.where(end_date: (start_date..end_date)).exists?
    return unless boat.bookings.where("start_date < ? AND end_date > ?", start_date, end_date).exists?

    errors.add(:base, "fully booked for these dates")
  end
end
