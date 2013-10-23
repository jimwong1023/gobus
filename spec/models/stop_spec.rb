require 'spec_helper'

describe Stop do
  it { should have_many :buses }
  it { should have_many :routes }

  it { should validate_presence_of :stop_id}
  it { should validate_presence_of :stop_title}
  it { should validate_presence_of :lat}
  it { should validate_presence_of :long}
end

