class RentalTransaction < ApplicationRecord
  belongs_to :library
  belongs_to :book
  belongs_to :membership

end
