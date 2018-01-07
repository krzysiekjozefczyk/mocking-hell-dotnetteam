require_relative '../../lib/user'
class BookFactory
  def self.create_single_book
    Book.new 4, 'John Doe', 'Red Book', 2000
  end

  def self.create_many_books
    [(Book.new 1, 'Mark Thompson', 'Red Book', 2000),
     (Book.new 2, 'John Doe', 'Green Book', 2001),
     (Book.new 3, 'Kate Anne', 'Blue Book', 2002)]
  end
end
