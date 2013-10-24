class Bus < ActiveRecord::Base
  has_and_belongs_to_many :stops
  has_and_belongs_to_many :routes

  validates :bus_line, :bus_title, presence: true, uniqueness: true
end