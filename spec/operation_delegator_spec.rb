require 'operation_delegator'

RSpec.describe OperationDelegator, '.call' do
  context 'when it\'s a value attribution' do
    it 'calls ValueAttributionProcessor' do
      expect(ValueAttributionProcessor).to receive(:call)

      described_class.call(:value_attribution, 'phrase')
    end
  end

  context 'when it\'s a currency attribution' do
    it 'calls CurrencyAttributionProcessor' do
      expect(CurrencyAttributionProcessor).to receive(:call)

      described_class.call(:currency_attribution, 'phrase')
    end
  end

  context 'when it\'s a value question' do
    it 'calls ValueQuestionProcessor' do
      expect(ValueQuestionProcessor).to receive(:call)

      described_class.call(:value_question, 'phrase')
    end
  end

  context 'when it\'s a currency question' do
    it 'calls CurrencyQuestionProcessor' do
      expect(CurrencyQuestionProcessor).to receive(:call)

      described_class.call(:currency_question, 'phrase')
    end
  end

  context 'when is not an expected value' do
    it 'returns nil' do
      expect(described_class.call(:random_operation, 'phrase')).to be_nil
    end
  end
end
