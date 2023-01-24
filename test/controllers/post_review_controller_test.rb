require 'test_helper'

class PostReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get user_id:integer" do
    get post_review_user_id:integer_url
    assert_response :success
  end

  test "should get game_id:integer" do
    get post_review_game_id:integer_url
    assert_response :success
  end

  test "should get review_title:string" do
    get post_review_review_title:string_url
    assert_response :success
  end

  test "should get opinion:text" do
    get post_review_opinion:text_url
    assert_response :success
  end

  test "should get rate:float" do
    get post_review_rate:float_url
    assert_response :success
  end

  test "should get review_image:string" do
    get post_review_review_image:string_url
    assert_response :success
  end

end
