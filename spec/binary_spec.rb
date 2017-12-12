require_relative '../lib/binary'

RSpec.describe '../lib/binary' do
  describe '#to_decimal' do
    it "converts binary '0' to decimal 0" do
      expect(Binary.to_decimal('0')).to eq 0
    end

    it "converts binary '1' to decimal 1" do
      expect(Binary.to_decimal('1')).to eq 1
    end

    it "converts binary '10' to decimal 2" do
      expect(Binary.to_decimal('10')).to eq 2
    end

    it "converts binary '11' to decimal 3" do
      expect(Binary.to_decimal('11')).to eq 3
    end

    it "converts binary '100' to decimal 4" do
      expect(Binary.to_decimal('100')).to eq 4
    end

    it "converts binary '1001' to decimal 9" do
      expect(Binary.to_decimal('1001')).to eq 9
    end

    it "converts binary '11010' to decimal 26" do
      expect(Binary.to_decimal('11010')).to eq 26
    end

    it "converts binary '10001101000' to decimal 1128" do
      expect(Binary.to_decimal('10001101000')).to eq 1128
    end

    it 'ignores leading zeros' do
      expect(Binary.to_decimal('000011111')).to eq 31
    end

    it "raises ArgumentError on invalid binary digit '2'" do
      expect { Binary.to_decimal('2') }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError on invalid binary digit '01201'" do
      expect { Binary.to_decimal('01201') }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError on invalid binary digit '10nope'" do
      expect { Binary.to_decimal('10nope') }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError on invalid binary digit 'nope10'" do
      expect { Binary.to_decimal('nope10') }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError on invalid binary digit '10nope10'" do
      expect { Binary.to_decimal('10nope10') }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError on invalid binary digit '001 nope'" do
      expect { Binary.to_decimal('001 nope') }.to raise_error(ArgumentError)
    end
  end
end
