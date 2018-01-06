class Book
  attr_accessor :id, :author, :title, :year, :genre

  def initialize(id, author, title, year, genre)
    @id = id
    @author = author
    @title = title
    @year = year
    @genre = genre
  end
end
