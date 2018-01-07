require_relative '../../lib/user'
require_relative 'book_factory'

class UserFactory
  def self.create_single_user_without_books
    User.new 99, 'Joe', 'Lopez', '92050411222'
  end

  def self.create_array_of_users_without_books
    [(User.new 1, 'Jon', 'Son', '91090877666'),
     (User.new 2, 'Anne', 'Smith', '92050455111'),
     (User.new 3, 'Mark', 'Twain', '93040333222'),
     (User.new 4, 'John', 'Doe', '91010155666'),
     (User.new 5, 'Tom', 'Parker', '85051045678'),
     (User.new 6, 'Kate', 'Smith', '75101198765'),
     (User.new 7, 'Edgar', 'Williams', '60110122333'),
     (User.new 8, 'Jen', 'Brown', '95030400111')]
  end

  def self.create_single_user_with_book
    user_id = 4
    book = BookFactory.create_single_book
    book.rented_by = user_id
    User.new user_id, 'Joe', 'Lopez', '92050411222', [book]
  end
end
