class Festival < ApplicationRecord
  has_many :bands

  validates :title, uniqueness: true

  validate :end_time_after_start_time

  def end_time_after_start_time
    if end_time < start_time
      errors.add(:end_time, "needs to be greater than start time")
    end
  end
end
