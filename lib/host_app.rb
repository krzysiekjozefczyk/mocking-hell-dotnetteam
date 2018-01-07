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
  end

  def print_gap
    @io.write ''
    @io.write ''
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
    message = result.nil? ? 'ERROR' : 'OK'
    write message
  end

  def create_user
    write 'ID?'
    id = read
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
    user_id = read
    result = @user_manager.remove_user user_id
    message = result.nil? ? 'ERROR' : 'OK'
    write message
  end
end

app = HostApp.new(ConsoleIo.new)
app.run
