class Route < ActiveRecord::Base
  belongs_to :bus
  has_and_belongs_to_many :stops

  validates :direction_tag, :direction_title, presence: true 
  validates :direction_tag, uniqueness: true
end