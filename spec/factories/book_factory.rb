require_relative '../../lib/user'
class BookFactory
  def self.create_single_book
    Book.new 912, 'John Doe', 'Red Book', 2000
  end

  def self.create_many_books
    [(Book.new 1, 'Mark Thompson', 'Red Book', 2000),
     (Book.new 2, 'John Doe', 'Green Book', 2001),
     (Book.new 3, 'Kate Anne', 'Blue Book', 2002),
     (Book.new 4, 'Robert Martin', 'Black Book', 2007),
     (Book.new 5, 'Robert Martin', 'White Book', 2005)]
  end
end
