class Binary
  def self.to_decimal(input)
    unless /^[0-1]*$/ =~ input
      raise ArgumentError
    end
    index = sum = 0
    until input[index].nil?
      current_character = input[index]
      sum = sum * 2 + current_character.to_i
      index += 1
    end
    sum
  end
end
