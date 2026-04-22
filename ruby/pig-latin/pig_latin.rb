module PigLatin
  def self.translate(words)
    words.split(' ').map { |word| translate_word word }.join(' ')
  end

  def self.translate_word(word)
    case word
    when /^[aeiou]/, /^xr/, /^yt/
      "#{word}ay"
    when /^[^aeiou]+y/
      partition = word.partition("y")
      [partition[1], partition[2], partition[0], "ay"].join
    when /^[^aeiou]?qu/
      partition = word.partition("qu")
      [partition[2], partition[0], partition[1], "ay"].join
    when /^[^aeiou]/
      partition = word.partition(/[aeiou]/)
      [partition[1], partition[2], partition[0], "ay"].join
    end
  end
end
