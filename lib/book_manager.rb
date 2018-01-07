class BookManager
  attr_accessor :books

  def initialize(books = [])
    @books = books
  end

  def book_count
    @books.count
  end

  def get_book(id)
    @books.find { |s| s.id == id }
  end

  def add_book(book)
    @books.push(book)
  end

  def remove_book(id)
    book = get_book(id)
    @books.delete(book)
  end

  def update_book(id, modified_book)
    book = get_book(id)
    copy_book(book, modified_book)
  end

  def copy_book(current_book, new_book)
    current_book.id = new_book.id
    current_book.author = new_book.author
    current_book.title = new_book.title
    current_book.year = new_book.year
    current_book
  end

  def rented_by(book) end
end
