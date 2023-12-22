class AddFieldsToMember < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :card_number, :string
    add_column :members, :expiration_date, :string
    add_column :members, :cvv, :string
  end
end
