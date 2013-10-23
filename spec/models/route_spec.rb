require 'spec_helper'

describe Route do
  it { should have_many :buses }
  it { should have_many :stops }

  it { should validate_presence_of :direction_tag }  
  it { should validate_presence_of :direction_title }  
  it { should validate_presence_of :inbound }  
end