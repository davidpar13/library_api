require "test_helper"

class FeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fee = fees(:one)
  end

  test "should get index" do
    get fees_url, as: :json
    assert_response :success
  end

  test "should create fee" do
    assert_difference("Fee.count") do
      post fees_url, params: { fee: { amount: @fee.amount, membership_id: @fee.membership_id, paid: @fee.paid } }, as: :json
    end

    assert_response :created
  end

  test "should show fee" do
    get fee_url(@fee), as: :json
    assert_response :success
  end

  test "should update fee" do
    patch fee_url(@fee), params: { fee: { amount: @fee.amount, membership_id: @fee.membership_id, paid: @fee.paid } }, as: :json
    assert_response :success
  end

  test "should destroy fee" do
    assert_difference("Fee.count", -1) do
      delete fee_url(@fee), as: :json
    end

    assert_response :no_content
  end
end
