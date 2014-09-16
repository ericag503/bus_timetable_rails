class Line < ActiveRecord::Base
  validates :name, :presence => true
  has_many :stations, through: :stops
  has_many :stops
end
