require 'merchant'
require 'currency_attribution_processor'

RSpec.describe CurrencyAttributionProcessor, '.call' do
  it 'stores metal and respective value in credits' do
    Merchant.call(['glob is I'])
    described_class.call('glob glob Silver is 34 Credits')

    expect(Merchant.metals['Silver']).to eq(17)
  end
end
