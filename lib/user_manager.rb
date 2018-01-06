class UserManager
  attr_accessor :users

  def initialize(users = [])
    @users = users
  end
end
