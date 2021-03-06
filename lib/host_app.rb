require_relative 'console_io'
require_relative 'user'
require_relative 'user_manager'
require_relative 'book'
require_relative 'book_manager'

class HostApp
  def initialize(io)
    @io = io
    @user_manager = UserManager.new
    @book_manager = BookManager.new
  end

  def write(message)
    @io.write ">> #{message}"
  end

  def read
    @io.read
  end

  def run
    loop do
      print_gap
      print_menu
      choose_option
    end
  end

  def print_menu
    write '-- MENU --'
    write '[1] LIST USERS'
    write '[2] ADD USER'
    write '[3] REMOVE USER'
    write '[4] UPDATE USER'
  end

  def print_gap
    @io.write ''
    @io.write ''
  end

  def status(result)
    result.nil? ? 'ERROR' : 'OK'
  end

  def choose_option
    option = read
    print_gap
    case option
    when '1'
      print_users
    when '2'
      add_user
    when '3'
      remove_user
    when '4'
      update_user
    else
      write 'Wrong option!'
    end
  end

  def print_users
    write '-- USERS --'
    @user_manager.users.each { |x| write x.to_s }
  end

  def add_user
    write '-- ADD NEW USER --'
    user = create_user
    result = @user_manager.add_user user
    write status(result)
  end

  def create_user
    write 'ID?'
    id = Integer(read)
    write 'First name?'
    first_name = read
    write 'Last name?'
    last_name = read
    write 'PESEL?'
    pesel = read
    User.new id, first_name, last_name, pesel
  end

  def remove_user
    write '-- REMOVE USER --'
    write 'ID?'
    user_id = Integer(read)
    result = @user_manager.remove_user user_id
    write status(result)
  end

  def update_user
    write '-- UPDATE USER --'
    write 'ID?'
    user_id = Integer(read)
    updated_user = create_user
    result = @user_manager.update_user(user_id, updated_user)
    write status(result)
  end

  def populate
    @user_manager.add_user(User.new(1, 'John', 'Doe', '91010155666'))
    @user_manager.add_user(User.new(2, 'Kate', 'Smith', '75101198765'))
    @user_manager.add_user(User.new(3, 'Tom', 'Parker', '85051045678'))
    @user_manager.add_user(User.new(4, 'Edgar', 'Williams', '60110122333'))
    @user_manager.add_user(User.new(5, 'Jen', 'Brown', '95030400111'))
  end
end
