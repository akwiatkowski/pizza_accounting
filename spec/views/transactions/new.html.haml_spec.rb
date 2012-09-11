require 'spec_helper'

describe "transactions/new" do
  before(:each) do
    assign(:transaction, stub_model(Transaction,
      :amount => 1.5,
      :direction => 1,
      :desc => "MyString"
    ).as_new_record)
  end

  it "renders new transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transactions_path, :method => "post" do
      assert_select "input#transaction_amount", :name => "transaction[amount]"
      assert_select "input#transaction_direction", :name => "transaction[direction]"
      assert_select "input#transaction_desc", :name => "transaction[desc]"
    end
  end
end
