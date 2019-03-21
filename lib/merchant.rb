require_relative './input_parser'
require_relative './operation_delegator'

# Supplies the output of the program
class Merchant
  ATTRIBUTIONS = %I[value_attribution currency_attribution].freeze

  # Hash to store attributions of galactic numbers to Roman numbers
  # glob: I, prok: V
  @galactic_numbers = {}

  attr_reader :galactic_numbers

  def self.call(phrase)
    new(phrase).call
  end

  def initialize(phrase)
    @phrase = phrase
  end

  def call
    phrase_type = InputParser.call(@phrase)

    return '' if ATTRIBUTIONS.include?(phrase_type)
    return 'I have no idea what you are talking about' if phrase_type == :error

    answer(phrase_type, @phrase)
  end

  def answer(phrase_type, phrase)
    OperationDelegator.call(phrase_type, phrase)
  end
end
