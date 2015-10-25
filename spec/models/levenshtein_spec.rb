require 'spec_helper'

RSpec.describe Levenshtein, type: :model do
  describe '.distance' do
    subject { described_class.distance(seq1, seq2) }

    context 'when lists are the same' do
      let(:seq1) { [1, 2, 3, 4, 5] }
      let(:seq2) { seq1 }

      it 'is zero' do
        expect(subject).to eq(0)
      end
    end

    context 'when lists have nothing in common' do
      let(:seq1) { [1, 2, 3, 4, 5] }
      let(:seq2) { [11, 12, 13, 14, 15] }

      it 'is sequence length' do
        expect(subject).to eq(seq1.size)
      end
    end

    context 'when one lists is empty' do
      let(:seq1) { [1, 2, 3, 4, 5] }
      let(:seq2) { [] }

      it 'is sequence length' do
        expect(subject).to eq(seq1.size)
      end
    end

    context 'when lists are of different size' do
      let(:seq1) { [1, 2, 3, 4, 5] }
      let(:seq2) { [1, 2, 3, 4, 5, 6, 7] }

      it 'is sequence length' do
        expect(subject).to eq(seq2.size - seq1.size)
      end
    end
  end
end
