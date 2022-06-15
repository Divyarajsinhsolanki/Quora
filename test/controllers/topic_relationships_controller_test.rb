require "test_helper"

class TopicRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get topic_relationships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get topic_relationships_destroy_url
    assert_response :success
  end
end
