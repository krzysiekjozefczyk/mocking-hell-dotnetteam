class User
  attr_accessor :id, :first_name, :last_name, :pesel, :overall_rented_books, :currently_rented_books

  def initialize(id, first_name, last_name, pesel, currently_rented_books = [])
    @id = id
    @first_name = first_name
    @last_name = last_name
    @pesel = pesel
    @overall_rented_books = 0
    @currently_rented_books = currently_rented_books
  end

  def to_s
    "[#{id}]: #{first_name} #{last_name} - #{pesel}"
  end
end
