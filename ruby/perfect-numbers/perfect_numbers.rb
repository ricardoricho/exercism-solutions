module PerfectNumber
  def self.classify(number)
    raise "Negative number" unless number.positive?

    if perfect?(number)
      'perfect'
    elsif abundant?(number)
      'abundant'
    else
      'deficient'
    end
  end

  def self.aliquot_sum(number)
    (1...number).select { |factor| (number % factor).zero? }.sum
  end

  def self.perfect?(number)
    aliquot_sum(number) == number
  end

  def self.abundant?(number)
    aliquot_sum(number) > number
  end

  def self.deficient?(number)
    aliquot_sum(number) < number
  end
end
