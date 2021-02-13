require 'test_helper'

class RelationshipOfficersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get relationship_officers_new_url
    assert_response :success
  end

end
