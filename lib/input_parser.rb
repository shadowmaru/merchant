# Parses the input and classifies according to the words
class InputParser
  private_class_method :new

  def self.call(phrase)
    new(phrase).call
  end

  def initialize(phrase)
    @phrase = phrase
  end

  def call
    return :currency_question if
      @phrase.start_with?(/how many credits is/i)
    return :value_question if @phrase.start_with?(/how much is/i)
    return :currency_attribution if @phrase.match?(/is \d+ credits/i)
    return :value_attribution if @phrase.match?(/is/i)

    :error
  end
end
