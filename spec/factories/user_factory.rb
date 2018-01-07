require_relative '../../lib/user'
require_relative 'book_factory'

class UserFactory
  def self.create_single_user_without_books
    User.new 4, 'Joe', 'Lopez', '92050411222'
  end

  def self.create_array_of_users_without_books
    [(User.new 1, 'Jon', 'Son', '91090877666'),
     (User.new 2, 'Anne', 'Smith', '92050455111'),
     (User.new 3, 'Mark', 'Twain', '93040333222')]
  end

  def self.create_single_user_with_book
    user_id = 4
    book = BookFactory.create_single_book
    book.rented_by = user_id
    User.new user_id, 'Joe', 'Lopez', '92050411222', [book]
  end
end
