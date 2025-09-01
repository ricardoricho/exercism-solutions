class ComplexNumber
  attr_reader :real, :imaginary
  EQUALITY_DELTA = 1e-15

  def initialize(real, imaginary = 0)
    @real = real.to_f
    @imaginary = imaginary.to_f
  end

  def +(other)
    ComplexNumber.new(real + other.real, imaginary + other.imaginary)
  end

  def -(other)
    ComplexNumber.new(real - other.real, imaginary - other.imaginary)
  end

  def *(other)
    ComplexNumber.new(real * other.real - imaginary * other.imaginary,
                      imaginary * other.real + real * other.imaginary)
  end

  def /(other) # comment to close /
    ComplexNumber.new((real * other.real + imaginary * other.imaginary).fdiv(
                        other.real ** 2 + other.imaginary ** 2),

                      (imaginary * other.real - real * other.imaginary).fdiv(
                        other.real ** 2 + other.imaginary ** 2))
  end

  def abs
    Math.sqrt(real ** 2 + imaginary ** 2)
  end

  def conjugate
    ComplexNumber.new(real, - imaginary)
  end

  def exp
    ComplexNumber.new(Math.exp(real)) *
      ComplexNumber.new(Math.cos(imaginary), Math.sin(imaginary))
  end

  def ==(other)
    (self - other).abs < EQUALITY_DELTA
  end
end
