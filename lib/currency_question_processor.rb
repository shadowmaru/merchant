# Answers the question about currency conversion
# e.g. 'how many Credits is glob prok Silver ?'
# => 'glob prok Silver is 68 Credits'
class CurrencyQuestionProcessor
  def self.call(phrase)
    new(phrase).call
  end

  def initialize(phrase)
    @phrase = phrase
  end

  def call
    _question, value = @phrase.split(' is ')
    numbers = value.delete!('?').strip!.split(' ')
    currency = numbers.pop

    "#{value} is #{value_in_arabic(numbers, currency)} Credits"
  end

  def value_in_arabic(numbers, currency)
    value = GalacticNumberConverter.call(numbers)

    (value * Merchant.metals[currency]).to_i
  end
end
