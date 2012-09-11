require 'spec_helper'

describe User do
  it "should create group after register" do
    u = User.new
    u.email = 'test@test.gov'
    u.password = 'password'
    u.password_confirmation = 'password'
    u.save!

    u.owned_group.should be_kind_of(Group)
  end
end
