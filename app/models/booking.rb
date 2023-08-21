class Booking < ApplicationRecord
  belongs_to :buyer
  belongs_to :boat
end
