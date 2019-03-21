require 'merchant'
require 'galactic_number_converter'

RSpec.describe GalacticNumberConverter, '.call' do
  it 'converts galactic numbers to arabic numbers' do
    Merchant.call(['glob is I', 'prok is V', 'pish is X', 'tegj is L'])
    expect(described_class.call(%w[pish tegj glob glob]))
      .to eql(42)
  end
end
