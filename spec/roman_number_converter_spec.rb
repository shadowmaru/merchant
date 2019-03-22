require 'roman_number_converter'

RSpec.describe RomanNumberConverter do
  describe '.call' do
    context 'with valid input' do
      context 'converts single numbers' do
        it 'converts I to 1' do
          expect(described_class.call('I')).to eq(1)
        end

        it 'converts V to 5' do
          expect(described_class.call('V')).to eq(5)
        end

        it 'converts X to 10' do
          expect(described_class.call('X')).to eq(10)
        end

        it 'converts L to 50' do
          expect(described_class.call('L')).to eq(50)
        end

        it 'converts C to 100' do
          expect(described_class.call('C')).to eq(100)
        end

        it 'converts D to 500' do
          expect(described_class.call('D')).to eq(500)
        end

        it 'converts M to 1000' do
          expect(described_class.call('M')).to eq(1000)
        end
      end

      context 'converts compound numbers' do
        it 'converts II to 2' do
          expect(described_class.call('II')).to eq(2)
        end

        it 'converts III to 3' do
          expect(described_class.call('II')).to eq(2)
        end

        it 'converts LXI to 61' do
          expect(described_class.call('LXI')).to eq(61)
        end
      end

      context 'converts subtracting numbers' do
        it 'converts IV to 4' do
          expect(described_class.call('IV')).to eq(4)
        end

        it 'converts XC to 90' do
          expect(described_class.call('XC')).to eq(90)
        end

        it 'converts CDXCIV to 494' do
          expect(described_class.call('CDXCIV')).to eq(494)
        end
      end

      context 'converts big numbers' do
        it 'converts MCMLXXVII to 1977' do
          expect(described_class.call('MCMLXXVII')).to eq(1977)
        end
      end
    end

    context 'with invalid input' do
      context 'not composed of roman numbers' do
        it 'returns nil' do
          expect(described_class.call('W')).to be_nil
        end
      end

      context 'not a valid compound roman number' do
        it 'returns nil' do
          expect(described_class.call('MCLDVI')).to be_nil
        end
      end
    end
  end

  describe '.valid?' do
    context 'with a valid roman number' do
      it 'returns true' do
        expect(described_class.valid?('II')).to be true
      end
    end

    context 'not composed of roman numbers' do
      it 'returns false' do
        expect(described_class.valid?('W')).to be false
      end
    end

    context 'not a valid compound roman number' do
      it 'returns false' do
        expect(described_class.valid?('MCLDVI')).to be false
      end
    end
  end

  describe '.valid_single?' do
    context 'with a valid single roman number' do
      it 'returns true' do
        expect(described_class.valid_single?('I')).to be true
        expect(described_class.valid_single?('V')).to be true
        expect(described_class.valid_single?('X')).to be true
        expect(described_class.valid_single?('L')).to be true
        expect(described_class.valid_single?('C')).to be true
        expect(described_class.valid_single?('D')).to be true
        expect(described_class.valid_single?('M')).to be true
      end

      context 'with an invalid single roman number' do
        it 'returns false' do
          expect(described_class.valid_single?('MM')).to be false
          expect(described_class.valid_single?('Y')).to be false
        end
      end
    end
  end
end
