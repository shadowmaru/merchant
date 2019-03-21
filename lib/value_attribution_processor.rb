# Stores the value attribution
# e.g. 'glob is I'
class ValueAttributionProcessor
  private_class_method :new

  def self.call(phrase)
    new(phrase).call
  end

  def initialize(phrase)
    @phrase = phrase
  end

  def call
    value_in_galactic, value_in_roman = @phrase.split(' is ')
    Merchant.galactic_numbers[value_in_galactic] = value_in_roman.strip

    nil
  end
end
