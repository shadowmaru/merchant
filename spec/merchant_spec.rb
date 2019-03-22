require 'merchant'

RSpec.describe Merchant, '.call' do
  context 'valid input' do
    it 'returns the answers' do
      phrases = [
        'glob is I',
        'prok is V',
        'pish is X',
        'tegj is L',
        'glob glob Silver is 34 Credits',
        'glob prok Gold is 57800 Credits',
        'pish pish Iron is 3910 Credits',
        'how much is pish tegj glob glob ?',
        'how many Credits is glob prok Silver ?',
        'how many Credits is glob prok Gold ?',
        'how many Credits is glob prok Iron ?',
        'how much wood could a woodchuck chuck if a woodchuck could chuck wood?'
      ]
      answers = [
        'pish tegj glob glob is 42',
        'glob prok Silver is 68 Credits',
        'glob prok Gold is 57800 Credits',
        'glob prok Iron is 782 Credits',
        'I have no idea what you are talking about'
      ]
      expect(described_class.call(phrases)).to eql(answers)
    end
  end

  context 'invalid input' do
    it 'returns error message' do
      phrase = 'how much wood could a woodchuck chuck if a woodchuck could\
       chuck wood ?'
      expect(described_class.call([phrase]))
        .to eq(['I have no idea what you are talking about'])
    end

    context 'question not covered' do
      it 'returns error message' do
        phrase = 'how come this is a test ?'
        expect(described_class.call([phrase]))
          .to eq(['I have no idea what you are talking about'])
      end
    end

    context 'compound roman number' do
      it 'returns error message' do
        phrase = 'glob is VII'
        expect(described_class.call([phrase]))
          .to eq(['I have no idea what you are talking about'])
      end
    end
  end
end
