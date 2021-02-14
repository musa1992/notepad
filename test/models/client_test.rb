require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  def setup
    @officer = relationship_officers(:officer)
    @client = @officer.clients.build(name: "client one", phone_no: "0123456789",
                                    due_date: "14/02/2021", end_date: "21/02/2021",
                                    installment_amount: 2050.00, loan_duration: 5)
  end

  test "should be valid" do
    assert @client.valid?
  end

  test "name should be present" do
    @client.name = " "
    assert_not @client.valid?
  end
  test "name should have minimum lenght of six" do
    @client.name = 'abc'
    assert_not @client.valid?
  end
  test "name should not be too long" do
    @client.name = "a" * 51
    assert_not @client.valid?
  end
  test "phone number should be present" do
    @client.phone_no = " "
    assert_not @client.valid?
  end
  test "phone number should be 10 digits long" do
    @client.phone_no = "123456789"
    assert_not @client.valid?
  end
  test "phone number should start with zero" do
    @client.phone_no = "1234567890"
    assert_not @client.valid?
  end

  test "relationship officer id should be present" do
    @client.relationship_officer_id = " "
    assert_not @client.valid?
  end
end
