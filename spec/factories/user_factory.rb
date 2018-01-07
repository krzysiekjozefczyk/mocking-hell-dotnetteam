require_relative '../../lib/user'

class UserFactory
  def self.create_single_user_without_books()
    User.new 1, 'Joe', 'Lopez', '92050411222'
  end
end
