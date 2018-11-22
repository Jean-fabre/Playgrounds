class Event < ApplicationRecord
  after_create :set_end_date
  belongs_to :user
  belongs_to :field

  def set_end_date
    # end_date.year = start_date.year
    # end_date.month = start_date.month
    # end_date.day = start_date.day
   self.end_date = self.end_date.change(day: start_date.day, month: start_date.month, year: start_date.year, hour: end_date.hour, min: end_date.min)
   self.save!
  end
end

