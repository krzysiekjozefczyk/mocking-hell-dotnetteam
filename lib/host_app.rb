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
end

app = HostApp.new(ConsoleIo.new)
app.add_user
app.print_users
