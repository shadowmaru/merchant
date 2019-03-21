require 'merchant'
require 'galactic_number_converter'

RSpec.describe GalacticNumberConverter, '.call' do
  it 'converts galactic numbers to arabic numbers' do
    Merchant.new(['glob is I', 'prok is V', 'pish is X', 'tegj is L']).call
    expect(described_class.call(%w[pish tegj glob glob]))
      .to eql(42)
  end
end
