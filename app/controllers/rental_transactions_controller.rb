class RentalTransactionsController < ApplicationController
  before_action :set_rental_transaction, only: %i[ show update destroy ]

  # GET /rental_transactions
  def index
    @rental_transactions = RentalTransaction.all

    render json: @rental_transactions
  end

  # GET /rental_transactions/1
  def show
    render json: @rental_transaction
  end

  # POST /rental_transactions
  def create
    @rental_transaction = RentalTransaction.new(rental_transaction_params)

    if @rental_transaction.save
      render json: @rental_transaction, status: :created, location: @rental_transaction
    else
      render json: @rental_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rental_transactions/1
  def update
    if @rental_transaction.update(rental_transaction_params)
      render json: @rental_transaction
    else
      render json: @rental_transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rental_transactions/1
  def destroy
    @rental_transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_transaction
      @rental_transaction = RentalTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rental_transaction_params
      params.require(:rental_transaction).permit(:checked_out_on, :returned_on, :library_id, :book_id, :membership_id)
    end
end
