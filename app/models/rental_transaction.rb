class RentalTransaction < ApplicationRecord
  belongs_to :library
  belongs_to :book
  belongs_to :membership

  validate :does_book_belong_to_lib?, on: :create
  validate :rental_possible?, on: :create

  after_create :mark_book_availability


  def does_book_belong_to_lib?
    find_book
    if checkout? && @book.library_id != self.library_id
      errors.add(:book, "does not belong to this library.")
    end
  end

  def rental_possible?
    if self.membership.outstanding_fees?
      errors.add(:membership, "has outstanding fees.")
    elsif self.membership.books_returned_for_membership?
      errors.add(:book, "outstanding.")
    end
  end

  def checkout?
    self.checked_out_on.present?
  end

  def return?
    self.returned_on.present?
  end

  def find_book
    @book = Book.find(self.book_id)
  end

  def mark_book_availability
    find_book
    if checkout?
      @book.update(checked_out: true, return_by: self.checked_out_on + 7.days)
    elsif return?
      @book.update(library_id: self.library_id, checked_out: false, return_by: nil)
    end
  end

end
