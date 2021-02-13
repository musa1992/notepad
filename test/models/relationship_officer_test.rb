require 'test_helper'

class RelationshipOfficerTest < ActiveSupport::TestCase
  def setup
    @ro = RelationshipOfficer.new(name: 'musa thika', email: 'musathika@gmail.com',
                                  password: "123456", password_confirmation: "123456")
  end

  test "should be valid" do
    assert @ro.valid?
  end

  test "name should be present" do
    @ro.name = "   "
    assert_not @ro.valid?
  end

  test "name should be have minimum length of six" do
    @ro.name = 'MUSA'
    assert_not @ro.valid?
  end

  test "name should not be too long" do
    @ro.name = "m" * 51
    assert_not @ro.valid?
  end

  test "email should be present" do
    @ro.email = " "
    assert_not @ro.valid?
  end
  test "email should not be too long" do
    @ro.email = "m" * 244 + "@example.com"
    assert_not @ro.valid?
  end
  test "email validation should accept valid emails" do
    valid_addresses = %w[user@example.com musathika@gmail.com USER@foo.com A_US-ER@foo.bar.org first.last@thika.co.ke]
    valid_addresses.each do |valid_address| 
      @ro.email = valid_address
      assert @ro.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid emails" do
    invalid_addresses = %w[user@example,com user.name@example user@example_example.com user@bar+bar.com user.org user.co.ke]
    invalid_addresses.each do |invalid_address| 
      @ro.email = invalid_address
      assert_not @ro.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email address should be unique" do
    duplicate_officer = @ro.dup
    duplicate_officer.email = @ro.email.upcase
    @ro.save
    assert_not duplicate_officer.valid?
  end

  test "email should be saved in lowercase" do
    mixed_case_email = 'UseRNew@example.COM'
    @ro.email = mixed_case_email
    @ro.save
    assert_equal mixed_case_email.downcase, @ro.reload.email
  end

  test "password should have a minimum length 6 " do
    @ro.password = @ro.password_confirmation = "q" * 5
    assert_not @ro.valid?
  end

  test "password should be present (non-blank)" do
    @ro.password = @ro.password_confirmation = " " * 6
    assert_not @ro.valid?
  end
end
