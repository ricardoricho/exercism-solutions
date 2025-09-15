module Raindrops
  def self.convert(number)
    factors = [3, 5 ,7].select{ |factor| number % factor == 0 }
    return number.to_s if factors.empty?

    factors.map { |factor| drop_sound(factor) }.join
  end

  def self.drop_sound(factor)
      case factor
      when 3
        'Pling'
      when 5
        'Plang'
      when 7
        'Plong'
      end
  end
end
