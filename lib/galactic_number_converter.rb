# Converts galactic numbers to arabic numbers
class GalacticNumberConverter
  private_class_method :new

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
