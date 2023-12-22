class AddFieldsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :checked_out, :boolean
    add_column :books, :return_by, :date
  end
end
