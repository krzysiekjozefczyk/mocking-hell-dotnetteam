class Book
  attr_accessor :id, :author, :title, :year

  def initialize(id, author, title, year)
    @id = id
    @author = author
    @title = title
    @year = year
  end
end
