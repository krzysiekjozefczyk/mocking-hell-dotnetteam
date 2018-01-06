class Library
  def initialize(user_manager, book_manager)
    @user_manager = user_manager
    @book_manager = book_manager
  end

  def rent_book(user_id, book_id)
    user = user_manager.get_user(user_id)
    book = book_manager.get_book(book_id)

    book.rented_by = user.id
    user.overall_rented_books += 1
    user_manager.add_book(user.id, book)
  end
end
