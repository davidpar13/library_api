require "test_helper"

class RentalTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rental_transaction = rental_transactions(:one)
  end

  test "should get index" do
    get rental_transactions_url, as: :json
    assert_response :success
  end

  test "should create rental_transaction" do
    assert_difference("RentalTransaction.count") do
      post rental_transactions_url, params: { rental_transaction: { book_id: @rental_transaction.book_id, checked_out_on: @rental_transaction.checked_out_on, library_id: @rental_transaction.library_id, membership_id: @rental_transaction.membership_id, returned_on: @rental_transaction.returned_on } }, as: :json
    end

    assert_response :created
  end

  test "should show rental_transaction" do
    get rental_transaction_url(@rental_transaction), as: :json
    assert_response :success
  end

  test "should update rental_transaction" do
    patch rental_transaction_url(@rental_transaction), params: { rental_transaction: { book_id: @rental_transaction.book_id, checked_out_on: @rental_transaction.checked_out_on, library_id: @rental_transaction.library_id, membership_id: @rental_transaction.membership_id, returned_on: @rental_transaction.returned_on } }, as: :json
    assert_response :success
  end

  test "should destroy rental_transaction" do
    assert_difference("RentalTransaction.count", -1) do
      delete rental_transaction_url(@rental_transaction), as: :json
    end

    assert_response :no_content
  end
end
