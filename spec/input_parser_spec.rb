require 'input_parser'

RSpec.describe InputParser, '.call' do
  context 'valid input' do
    context 'when a value attribution is passed' do
      it 'returns :value_attribution' do
        expect(described_class.call('glob is I')).to eq(:value_attribution)
      end
    end

    context 'when a currency conversion attribution is passed' do
      it 'returns :currency_attribution' do
        expect(described_class.call('glob prok Gold is 57800 Credits'))
          .to eq(:currency_attribution)
      end
    end

    context 'when a value conversion question is passed' do
      it 'returns :value_question' do
        expect(described_class.call('how much is pish tegj glob glob ?'))
          .to eq(:value_question)
      end
    end

    context 'when a currency conversion question is passed' do
      it 'returns :currency_question' do
        expect(described_class.call('how many Credits is glob prok Silver ?'))
          .to eq(:currency_question)
      end
    end
  end

  context 'invalid input' do
    it 'returns :error' do
      phrase = 'how much wood could a woodchuck chuck if a woodchuck could\
       chuck wood ?'
      expect(described_class.call(phrase))
        .to eq(:error)
    end
  end
end
