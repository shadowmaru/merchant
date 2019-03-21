require 'merchant'
require 'roman_number_converter'
require 'value_question_processor'

RSpec.describe ValueQuestionProcessor, '.call' do
  context 'given previous value attributions' do
    it 'answers a value question' do
      Merchant.call(['glob is I', 'prok is V', 'pish is X', 'tegj is L'])
      expect(described_class.call('how much is pish tegj glob glob ?'))
        .to eql('pish tegj glob glob is 42')
    end
  end
end
