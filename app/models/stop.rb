class Stop < ActiveRecord::Base
  # validates :name, :presence => true
  belongs_to :station
  belongs_to :line
end
