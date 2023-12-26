class Book < ApplicationRecord
  belongs_to :library
  has_many :rental_transactions
  has_many :fees

  before_create :add_isbn

  scope :title_and_library, ->(title, library_id) { where(title:  title, library_id: library_id).order(return_by: :asc) }
  scope :title, ->(title) { where(title:  title).order(return_by: :asc) }
  scope :overdue, -> { where(checked_out: true).where('return_by <= ?', Time.now)}


  def add_isbn
    #Lets see if we have the same book already and get the isbn
    isbn = Book.isbn_exists?(self.title, self.author)

    if isbn
      #if we already have that book, recycle the isbn
      self.isbn = isbn
    else
      latest_isbn = Book.latest_isbn
      if latest_isbn.present?
        # if we dont we assign the next available isbn
        self.isbn = latest_isbn.isbn.next
      else
        # if we have no books at all, start from 000001
        self.isbn = '000001'
      end
    end
  end


  def self.latest_isbn
    self.select(:isbn).order(isbn: :desc).first
  end

  def self.isbn_exists?(title, author)
    book = Book.find_by(title: title, author: author)
    return book&.isbn
  end

  def self.book_search(title, library_id = '')
    if library_id.present?
      books = Book.title_and_library(title, library_id)
      Book.book_iteration(books)
    else
      books = Book.title(title)
      Book.book_iteration(books)
    end
  end

  # abstracted out the iteration to search for books
  def self.book_iteration(books)
    books.each do |b|
      if !b.checked_out
        # return available book
        return b
      else
        # else return the book to be available the soonest since the scope is sorting by return_by asc
        return books.first
      end
    end
  end

end
