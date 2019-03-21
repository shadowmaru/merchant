require 'merchant'
require 'currency_question_processor'

RSpec.describe CurrencyQuestionProcessor, '.call' do
  context 'given previous value attributions' do
    it 'answers a currency question' do
      Merchant
        .new([
               'glob is I',
               'prok is V',
               'pish is X',
               'tegj is L',
               'glob prok Gold is 57800 Credits'
             ])
        .call
      expect(described_class.call('how many Credits is glob prok Gold ?'))
        .to eql('glob prok Gold is 57800 Credits')
    end
  end
end
