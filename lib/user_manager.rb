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

  def add_user(user)
    @users.push(user)
  end

  def remove_user(id)
    @users.delete_if { |user| user.id == id }
  end
end
