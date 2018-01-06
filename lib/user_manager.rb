class UserManager
  attr_accessor :users

  def initialize(users = [])
    @users = users
  end

  def user_count
    @users.count
  end

  def get_user(id)
    @users.find { |s| s.id == id }
  end
end
