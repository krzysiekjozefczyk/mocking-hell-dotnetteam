class User
  attr_accessor :id, :name, :surname, :pesel

  def initialize(id, name, surname, pesel)
    @id = id
    @name = name
    @surname = surname
    @pesel = pesel
  end
end
