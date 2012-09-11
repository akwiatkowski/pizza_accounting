require 'spec_helper'

describe Transaction do
  it "should create simple transaction" do
    t = FactoryGirl.build(:transaction)
    t.should be_valid
  end
end
