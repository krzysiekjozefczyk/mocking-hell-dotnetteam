class Binary
  def self.to_decimal(input)
    raise ArgumentError unless /^[0-1]*$/ =~ input
    index = sum = 0
    until input[index].nil?
      current_character = input[index]
      sum = sum * 2 + current_character.to_i
      index += 1
    end
    sum
  end
end
