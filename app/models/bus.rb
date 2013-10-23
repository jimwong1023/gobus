class Bus < ActiveRecord::Base
  has_many :stops, through: :buses_stops
  has_many :routes, through: :buses_routes

  validates :bus_line, :bus_title, presence: true
end