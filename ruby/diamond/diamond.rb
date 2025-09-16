module Diamond
  def self.make_diamond(letter)
    letters = letters_until(letter)
    upper_triangle = letters.map.with_index do |letter, index|
      prefix = letters.length - index - 1
      "#{' ' * prefix}#{letter}#{' ' * index}"
    end
    upper_diamond = upper_triangle.map{ |line| complement(line) }
    complement(upper_diamond).join("\n").concat("\n")
  end

  def self.letters_until(letter)
    ('A'..letter).to_a
  end

  # Polymorphic: line is an array or a string
  def self.complement(line)
    line + line.reverse.slice(1..)
  end
end
