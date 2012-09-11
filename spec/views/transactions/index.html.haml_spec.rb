require 'spec_helper'

describe "transactions/index" do
  before(:each) do
    assign(:transactions, [
      stub_model(Transaction,
        :amount => 1.5,
        :direction => 1,
        :desc => "Desc"
      ),
      stub_model(Transaction,
        :amount => 1.5,
        :direction => 1,
        :desc => "Desc"
      )
    ])
  end

  it "renders a list of transactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
  end
end
