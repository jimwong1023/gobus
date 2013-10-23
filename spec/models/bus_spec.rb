require 'spec_helper'

describe Bus do
  it { should have_many :stops }
  it { should have_many :routes }

  it { should validate_presence_of :bus_line }
  it { should validate_presence_of :bus_title }
end