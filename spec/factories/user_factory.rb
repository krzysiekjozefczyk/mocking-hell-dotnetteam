require_relative '../../lib/user'

class UserFactory
  def self.create_single_user_without_books
    User.new 4, 'Joe', 'Lopez', '92050411222'
  end

  def self.create_array_of_users_without_books
    [(User.new 1, 'Jon', 'Son', '91090877666'),
     (User.new 2, 'Anne', 'Smith', '92050455111'),
     (User.new 3, 'Mark', 'Twain', '93040333222')]
  end
end
