require 'spec_helper'

describe User do
  it "should create group after register" do
    u = User.new
    u.email = 'test@test.gov'
    u.password = 'password'
    u.password_confirmation = 'password'
    u.valid?
    u.save!

    u.owned_group.should be_kind_of(Group)
    u.owned_group.save!
    Group.count.should == 1
  end

  it "should create some users and add all of them to one group" do
    how_many_users = 3

    how_many_users.times do
      u = FactoryGirl.create(:user)
      u.should be_valid
    end

    # add users
    g = Group.first
    User.all.each do |user|
      g.users << user
    end
    g.should be_valid
    g.save!

    g.users.count.should == how_many_users

  end
end
