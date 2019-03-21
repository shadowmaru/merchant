# Stores the currency attribution
# e.g. 'glob glob Silver is 34 Credits'
# { 'Silver': 17 }
class CurrencyAttributionProcessor
  private_class_method :new

  def self.call(phrase)
    new(phrase).call
  end

  def initialize(phrase)
    @phrase = phrase
  end

  def call
    valid_galactic_numbers = Merchant.galactic_numbers.keys
    value_in_galactic, value_in_credits = @phrase.split(' is ')
    value_in_galactic = value_in_galactic.split(' ')
    metal = (value_in_galactic - valid_galactic_numbers).first

    value_in_credits = value_in_credits.delete('Credits').strip.to_f

    Merchant.metals[metal] = value_in_credits / GalacticNumberConverter
                             .call(value_in_galactic)

    nil
  end
end
