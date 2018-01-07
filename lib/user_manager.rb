class UserManager
  attr_accessor :users

  def initialize(users = [])
    @users = users
  end

  def user_count
    @users.count
  end

  def get_user(id)
    @users.find { |user| user.id == id }
  end

  def add_user(user)
    @users.push(user)
  end

  def remove_user(id)
    @users.delete_if { |user| user.id == id }
  end

  def update_user(id, modified_user)
    user = get_user(id)
    copy_user(user, modified_user)
  end

  def copy_user(current_user, new_user)
    current_user.id = new_user.id
    current_user.first_name = new_user.first_name
    current_user.last_name = new_user.last_name
    current_user.pesel = new_user.pesel
    current_user
  end

  def add_book(user_id, book)
    user = get_user(user_id)
    user.currently_rented_books.push(book)
    user.overall_rented_books += 1    
  end

  def remove_book(user_id, book) end
end
