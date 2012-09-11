require 'spec_helper'

describe Transaction do
  it "should create simple transaction" do
    t = FactoryGirl.build(:transaction)
    t.should be_valid
  end

  context "adding transactions" do
    before :each do
      @owner = FactoryGirl.create(:user, email: "owner@owner.com")
      @users = Array.new
      2.times do
        @users << FactoryGirl.build(:user)
      end
      @group = @owner.owned_group
      @group.users = [@owner] + @users
      @group.should be_valid
      @group.save!
    end

    it "should add ordinary transactions during buying food" do
      user_a = @users[0]
      user_b = @users[1]

      transactions = Array.new

      t = Transaction.new
      t.creator = user_a
      t.payer = user_a
      t.amount = 10
      t.incoming_direction!
      t.group = @group
      t.should be_valid
      t.save!
      transactions << t

      t = Transaction.new
      t.creator = user_b
      t.payer = user_b
      t.amount = 8
      t.incoming_direction!
      t.group = @group
      t.should be_valid
      t.save!
      transactions << t

      t = Transaction.new
      t.creator = user_a
      t.payer = user_a
      t.amount = 5
      t.outgoing_direction!
      t.group = @group
      t.should be_valid
      t.save!
      transactions << t

      t = Transaction.new
      t.creator = user_b
      t.payer = user_b
      t.amount = 6
      t.incoming_direction!
      t.group = @group
      t.should be_valid
      t.save!
      transactions << t

      @users
    end
  end
end
