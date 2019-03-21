# Answers the question of value
# e.g. 'how much is pish tegj glob glob ?'
class ValueQuestionProcessor
  private_class_method :new

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

  private

  def value_in_arabic(numbers)
    GalacticNumberConverter.call(numbers)
  end
end
