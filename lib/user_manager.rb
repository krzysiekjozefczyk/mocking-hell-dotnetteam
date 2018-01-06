class UserManager
  attr_accessor :users

  def initialize(users = [])
    @users = users
  end

  def user_count
    @users.count
  end
end
