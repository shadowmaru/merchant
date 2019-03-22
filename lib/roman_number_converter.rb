# Converts Roman numbers to Arabic (Integer)
class RomanNumberConverter
  ROMAN_REGEX = /^M*(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])$/i.freeze
  ROMAN_SINGLE = /^(I|V|X|L|C|D|M)$/.freeze
  ROMANS = {
    M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10,
    IX: 9, V: 5, IV: 4, I: 1
  }.freeze

  private_class_method :new

  def self.call(number)
    new(number).call
  end

  def self.valid?(number)
    new(number).valid?
  end

  def self.valid_single?(number)
    new(number).valid_single?
  end

  def initialize(number)
    @number = number
  end

  def call
    return nil unless valid?

    arabic = 0
    ROMANS.each do |key, value|
      while @number.index(key.to_s) == 0
        arabic += value
        @number.slice!(key.to_s)
      end
    end
    arabic
  end

  def valid?
    @number&.match?(ROMAN_REGEX)
  end

  def valid_single?
    @number&.match?(ROMAN_SINGLE)
  end
end
