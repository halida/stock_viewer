class Record < ActiveRecord::Base
  validates_presence_of :interval

  INTERVALS = ["day", "hour", "minute"]
  validates :interval, :inclusion => INTERVALS
end
