require 'rails_helper'

RSpec.describe Color, :type => :model do
  let(:color) { Color.new }

  describe 'randomize' do
    it 'returns a Color' do
      expect(color.randomize).to be_a(Color)
    end

    %w{red green blue}.each do |component|
      it "sets #{component} to random value" do
        expect {
          color.randomize
        }.to change { color.send(component) }.from(nil)
      end
    end
  end

  describe 'to_hex' do
    it 'returns a String' do
      expect(color.to_hex).to be_a(String)
    end

    [
      { color: { red: 255, green: 255, blue: 255 }, result: '#ffffff' },
      { color: { red: 0, green: 0, blue: 0 }, result: '#000000' },
      { color: { red: 128, green: 128, blue: 128 }, result: '#808080' },
      { color: { red: 255, green: 255, blue: 0 }, result: '#ffff00' }
    ].each do |c|
      it "returns a hex representation of the color #{c[:color]}" do
        expect(Color.new(c[:color]).to_hex).to eq(c[:result])
      end
    end
  end
end
