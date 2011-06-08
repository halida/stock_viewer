class Stock < ActiveRecord::Base
  validates_presence_of :name

  has_many :records, :dependent => :destroy
  
end
