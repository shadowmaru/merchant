# Converts galactic numbers to arabic numbers
class GalacticNumberConverter
  def self.call(numbers)
    new(numbers).call
  end

  def initialize(numbers)
    @numbers = numbers
  end

  def call
    total = @numbers.map { |number| Merchant.galactic_numbers[number] }.join
    RomanNumberConverter.call(total)
  end
end
