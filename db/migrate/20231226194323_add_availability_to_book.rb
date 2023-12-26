class AddAvailabilityToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :availability, :string
  end
end
