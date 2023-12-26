class AddBookIdToFee < ActiveRecord::Migration[7.0]
  def change
    add_reference :fees, :book_id, index: true
  end
end
