class BookManager
  attr_accessor :books

  def initialize(books = [])
      @books = books
  end

  def get_book_count()
      @books.count
  end

  def get_book(id)
    @books.find { |s| s.id = id}
  end

  def add_book(book)
      @books.push(book)
  end

  def remove_book(id)
    book = get_book(id)
    @books.delete(book)
  end
end
