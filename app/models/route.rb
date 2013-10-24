class Route < ActiveRecord::Base
  has_and_belongs_to_many :buses
  has_and_belongs_to_many :stops

  validates :direction_tag, :direction_title, :inbound, presence: true 
  validates :direction_tag, uniqueness: true
end