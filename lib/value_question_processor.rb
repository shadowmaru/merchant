require_relative 'galactic_number_converter'

# Answers the question of value
# e.g. 'how much is pish tegj glob glob ?'
class ValueQuestionProcessor
  def self.call(phrase)
    new(phrase).call
  end

  def initialize(phrase)
    @phrase = phrase
  end

  def call
    _question, value = @phrase.split(' is ')
    numbers = value.delete!('?').strip!.split(' ')

    "#{value} is #{value_in_arabic(numbers)}"
  end

  def value_in_arabic(numbers)
    GalacticNumberConverter.call(numbers)
  end
end
