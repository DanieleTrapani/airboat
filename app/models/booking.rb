class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  validates :start_date, presence: true
  validates :end_date, presence: true


  def validate?
    self.end_date > self.start_date
  end
end
