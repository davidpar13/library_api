class CreateRentalTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :rental_transactions do |t|
      t.datetime :checked_out_on
      t.datetime :returned_on
      t.references :library, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.references :membership, null: false, foreign_key: true

      t.timestamps
    end
  end
end
