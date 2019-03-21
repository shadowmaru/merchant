require 'value_attribution_processor'

RSpec.describe ValueAttributionProcessor, '.call' do
  it 'stores galactic number and the value in roman number' do
    described_class.call('glob is I')

    expect(Merchant.galactic_numbers['glob']).to eq('I')
  end
end
