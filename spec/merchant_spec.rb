require 'merchant'

RSpec.describe Merchant, '.call' do
  context 'valid input' do
    context 'when a value attribution is passed' do
      it 'returns nothing' do
        expect(described_class.call('glob is I')).to eq('')
      end
    end

    context 'when a currency conversion attribution is passed' do
      it 'returns nothing' do
        expect(described_class.call('glob prok Gold is 57800 Credits'))
          .to eq('')
      end
    end

    context 'when a value conversion question is passed' do
      it 'returns the answer' do
        pending 'not implemented'
        expect(described_class.call('how much is pish tegj glob glob ?'))
          .to eq('pish tegj glob glob is 42')
      end

      context 'when a currency conversion question is passed' do
        it 'returns the answer' do
          pending 'not implemented'
          expect(described_class.call('how many Credits is glob prok Silver ?'))
            .to eq('glob prok Silver is 68 Credits')
        end
      end
    end
  end

  context 'invalid input' do
    it 'returns error message' do
      phrase = 'how much wood could a woodchuck chuck if a woodchuck could\
       chuck wood ?'
      expect(described_class.call(phrase))
        .to eq('I have no idea what you are talking about')
    end
  end
end
