# frozen_string_literal: true

require File.join(File.dirname(__FILE__), '..', 'gilded_rose')

describe GildedRose do
  subject(:gilded_rose) { GildedRose.new(Array(item)) }

  describe '#update_quality' do
    subject { gilded_rose.update_quality }

    let(:item) { build(:item, sell_in: sell_in, quality: quality) }
    let(:quality) { 12 }
    let(:sell_in) { 4 }

    context 'for a standard item' do
      context 'when sell_in is positive' do
        let(:sell_in) { 3 }

        it('decreases the quality by 1') { expect { subject }.to change { item.quality }.by(-1) }
        it('decreases the sell-in by 1') { expect { subject }.to change { item.sell_in }.by(-1) }
      end

      context 'when the sell_in is zero' do
        let(:sell_in) { 0 }

        it('decreases the quality by 2') { expect { subject }.to change { item.quality }.by(-2) }
        it('decreases the sell-in by 1') { expect { subject }.to change { item.sell_in }.by(-1) }
      end

      context 'when the sell_in is negative' do
        let(:sell_in) { -1 }

        it('decreases the quality by 2') { expect { subject }.to change { item.quality }.by(-2) }
        it('decreases the sell-in by 1') { expect { subject }.to change { item.sell_in }.by(-1) }
      end
    end

    context 'for "Sulfuras, Hand of Ragnaros"' do
      let(:item) { build(:item, :sulfuras, sell_in: sell_in) }

      [3, 0, -1].each do |sell_in|
        context "when the sell_in is #{ sell_in }" do
          let(:sell_in) { sell_in }
          it('does not decrease the quality') { expect { subject }.not_to change { item.quality } }
          it('does not decrease the sell-in') { expect { subject }.not_to change { item.quality } }
        end
      end
    end

    context 'for "Aged Brie"' do
      let(:item) { build(:item, :brie, sell_in: sell_in, quality: quality) }

      context 'when sell_in is positive' do
        let(:sell_in) { 3 }

        it('increases the quality by 1') { expect { subject }.to change { item.quality }.by(1) }
        it('decreases the sell-in by 1') { expect { subject }.to change { item.sell_in }.by(-1) }
      end

      context 'when the sell_in is zero' do
        let(:sell_in) { 0 }

        it('increases the quality by 2') { expect { subject }.to change { item.quality }.by(2) }
        it('decreases the sell-in by 1') { expect { subject }.to change { item.sell_in }.by(-1) }
      end

      context 'when the sell_in is negative' do
        let(:sell_in) { -1 }

        it('increases the quality by 2') { expect { subject }.to change { item.quality }.by(2) }
        it('decreases the sell-in by 1') { expect { subject }.to change { item.sell_in }.by(-1) }
      end

      context 'when the quality is 50' do
        let(:quality) { 50 }
        it('does not increase the quality') { expect { subject }.not_to change{ item.quality } }
      end
    end

    context 'for "Backstage passes to a TAFKAL80ETC concert"' do
      let(:item) { build(:item, :backstage_passes, sell_in: sell_in, quality: quality) }

      context 'when the sell_in is 11' do
        let(:sell_in) { 11 }
        it('increases the quality by 1') { expect { subject }.to change { item.quality }.by(1) }
      end

      context 'when the sell_in is 10' do
        let(:sell_in) { 10 }
        it('increases the quality by 2') { expect { subject }.to change { item.quality }.by(2) }
      end

      context 'when the sell_in is 6' do
        let(:sell_in) { 6 }
        it('increases the quality by 2') { expect { subject }.to change { item.quality }.by(2) }
      end

      context 'when the sell_in is 5' do
        let(:sell_in) { 5 }
        it('increases the quality by 3') { expect { subject }.to change { item.quality }.by(3) }
      end

      context 'when the sell_in is 0' do
        let(:sell_in) { 0 }
        it('decreases the quality to 0') { expect { subject }.to change { item.quality }.to(0) }
      end

      context 'when the sell_in is -1' do
        let(:sell_in) { -1 }
        it('decreases the quality to 0') { expect { subject }.to change { item.quality }.to(0) }
      end
    end
  end
end
