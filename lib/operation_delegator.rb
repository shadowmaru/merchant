require_relative './value_attribution_processor'
require_relative './currency_attribution_processor'
require_relative './value_question_processor'
require_relative './currency_question_processor'

# Decides which class will handle the input
class OperationDelegator
  def self.call(phrase_type, phrase)
    new(phrase_type, phrase).call
  end

  def initialize(phrase_type, phrase)
    @phrase_type = phrase_type
    @phrase = phrase
  end

  def call
    case @phrase_type
    when :value_attribution
      ValueAttributionProcessor.call(@phrase)
    when :currency_attribution
      CurrencyAttributionProcessor.call(@phrase)
    when :currency_question
      CurrencyQuestionProcessor.call(@phrase)
    when :value_question
      ValueQuestionProcessor.call(@phrase)
    end
  end
end
