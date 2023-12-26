class Fee < ApplicationRecord
  belongs_to :membership
  belongs_to :book

  def self.calculate_fees
    books = Book.all.overdue
    books.each do |b|
      b.amount += 1.00
      b.save
    end
  end

end
