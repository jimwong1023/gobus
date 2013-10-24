require 'spec_helper'

describe Bus do
  it { should have_and_belong_to_many :stops }
  it { should have_many :routes }

  it { should validate_presence_of :bus_line }
  it { should validate_presence_of :bus_title }

  it { should validate_uniqueness_of :bus_line }
  it { should validate_uniqueness_of :bus_title }  
end