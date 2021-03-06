require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :user_id => 1,
        :email => "Email",
        :name => "Name",
        :address => "MyText",
        :pay_type => "Pay Type",
        :order_status => "Order Status"
      ),
      stub_model(Order,
        :user_id => 1,
        :email => "Email",
        :name => "Name",
        :address => "MyText",
        :pay_type => "Pay Type",
        :order_status => "Order Status"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Pay Type".to_s, :count => 2
    assert_select "tr>td", :text => "Order Status".to_s, :count => 2
  end
end
