class Route < ActiveRecord::Base
  has_many :buses, through: :buses_routes
  has_many :stops, through: :routes_stops

  validates :direction_tag, :direction_title, :inbound, presence: true
end