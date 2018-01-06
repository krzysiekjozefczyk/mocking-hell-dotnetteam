class BookManager
    attr_accessor :books

    def initialize(books = [])
        @books = books
    end

    def get_book_count()
        @books.count
    end
end
