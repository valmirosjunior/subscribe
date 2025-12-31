require 'spec_helper'
require 'input_parser'

RSpec.describe InputParser do
  describe '.parse_as_product' do
    subject { described_class.parse_as_product(line) }

    context 'with valid input' do
      context 'when product is not imported' do
        let(:line) { '2 book at 12.49' }

        it 'creates product with correct attributes' do
          expect(subject.description).to eq('book')
          expect(subject.value).to eq(12.49)
          expect(subject.quantity).to eq(2)
          expect(subject.imported).to be false
        end
      end

      context 'when product is imported' do
        let(:line) { '1 imported box of chocolates at 10.00' }

        it 'creates product with correct attributes' do
          expect(subject.description).to eq('imported box of chocolates')
          expect(subject.value).to eq(10.00)
          expect(subject.quantity).to eq(1)
          expect(subject.imported).to be true
        end
      end

      context 'with different quantity' do
        let(:line) { '3 imported boxes of chocolates at 11.25' }

        it 'parses quantity correctly' do
          expect(subject.quantity).to eq(3)
        end
      end
    end

    context 'with invalid input' do
      context 'when line is nil' do
        let(:line) { nil }

        it { is_expected.to be_nil }
      end

      context 'when line is empty' do
        let(:line) { '' }

        it { is_expected.to be_nil }
      end

      context 'when line is whitespace' do
        let(:line) { '   ' }

        it { is_expected.to be_nil }
      end

      context 'when line does not match pattern' do
        let(:line) { 'invalid input' }

        it { is_expected.to be_nil }
      end
    end
  end
end
