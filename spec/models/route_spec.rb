require 'spec_helper'

describe Route do
  it { should belong_to :bus }
  it { should have_and_belong_to_many :stops }

  it { should validate_presence_of :direction_tag }  
  it { should validate_presence_of :direction_title }  
  
  it { should validate_uniqueness_of :direction_tag }
end