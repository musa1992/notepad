require 'test_helper'

class OfficersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do 
    get signup_path
    assert_no_difference 'RelationshipOfficer.count' do
      post relationship_officers_path, params: {relationship_officer:{ name: " ",
                                                                       email: "user@invalid",
                                                                       password: "123",
                                                                       password_confirmation: "qwe"}}
    end
    assert_template 'relationship_officers/new'
  end

  test "valid signup" do
    get signup_path
    assert_difference 'RelationshipOfficer.count', 1 do
      post relationship_officers_path, params: {relationship_officer: {name: "user one",
                                                                      email: "user_one@gmail.com",
                                                                      password: "123456",
                                                                      password_confirmation: "123456"}}
    end
    follow_redirect!
    assert_template 'relationship_officers/show'
  end
end
