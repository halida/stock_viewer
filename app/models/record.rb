class Record < ActiveRecord::Base
  validates_presence_of :name, :type

  TYPES = ["day", "hour", "minute"]
  validates :type, :inclusion => TYPES
end
