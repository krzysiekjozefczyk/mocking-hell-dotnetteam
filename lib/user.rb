class User
  attr_accessor :id, :first_name, :last_name, :pesel

  def initialize(id, first_name, last_name, pesel)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @pesel = pesel
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
