# frozen_string_literal: true

require File.join(File.dirname(__FILE__), '..', 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    subject { described_class.new([item]).update_quality }
    let(:item) { build(:item, name: 'foo') }

    it 'does not change the name' do
      subject
      expect(item.name).to eq 'fixme'
    end
  end
end
