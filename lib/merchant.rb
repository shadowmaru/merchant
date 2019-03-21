require_relative './input_parser'
require_relative './roman_number_converter'
require_relative './galactic_number_converter'
require_relative './operation_delegator'
require_relative './value_attribution_processor'
require_relative './value_question_processor'
require_relative './currency_attribution_processor'
require_relative './currency_question_processor'

# Supplies the output of the program
class Merchant
  private_class_method :new

  # Hash to store attributions of galactic numbers to Roman numbers
  # glob: I, prok: V
  @galactic_numbers = {}

  # Hash to store metal unit values in Credits
  # { 'Gold': 23, 'Silver': 12 }
  @metals = {}

  def self.galactic_numbers
    @galactic_numbers
  end

  def self.metals
    @metals
  end

  def self.call(phrases)
    new(phrases).call
  end

  def initialize(phrases)
    @phrases = phrases
  end

  def call
    @phrases.map { |phrase| process_phrase(phrase) }.compact
  end

  def process_phrase(phrase)
    phrase_type = InputParser.call(phrase)

    return 'I have no idea what you are talking about' if phrase_type == :error

    answer(phrase_type, phrase)
  end

  def answer(phrase_type, phrase)
    OperationDelegator.call(phrase_type, phrase)
  end
end
