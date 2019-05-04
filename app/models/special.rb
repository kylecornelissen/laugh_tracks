class Special < ApplicationRecord
  belongs_to :comedian

  validates_presence_of :name
  validates_presence_of :run_time
  
end
