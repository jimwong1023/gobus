class Stop < ActiveRecord::Base
  has_many :buses, through: :buses_stops
  has_many :routes, through: :routes_stops

  validates :lat, :long, :stop_id, :stop_title, presence: true  
end