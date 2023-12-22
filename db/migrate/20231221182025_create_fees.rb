class CreateFees < ActiveRecord::Migration[7.0]
  def change
    create_table :fees do |t|
      t.boolean :paid
      t.decimal :amount
      t.references :membership, null: false, foreign_key: true

      t.timestamps
    end
  end
end
