class Stop < ActiveRecord::Base
  has_and_belongs_to_many :buses
  has_and_belongs_to_many :routes

  validates :lat, :long, :stop_id, :stop_title, presence: true
  validates :stop_id, uniqueness: true
end