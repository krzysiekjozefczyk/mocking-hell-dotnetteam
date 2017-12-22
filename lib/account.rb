class Account
  attr_accessor :balance

  def initialize(id, user_name, password, balance)
    @id = id
    @user_name = user_name
    @password = password
    @balance = balance
  end
end
