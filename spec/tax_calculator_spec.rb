require 'spec_helper'
require 'tax_calculator'
require 'product'

RSpec.describe TaxCalculator do
  describe '#initialize' do
    subject { described_class.new(product) }

    let(:product) { build(:product) }

    it 'assigns product' do
      expect(subject.product).to eq(product)
    end
  end

  describe '#calculate' do
    subject { described_class.new(product).calculate }

    let(:value) { 100.00 }
    let(:quantity) { 10 }
    let(:product) { build(:product, *traits, value: value, quantity: quantity) }
    let(:traits) { %i[not_exempt not_imported] }

    context 'when product is imported' do
      context 'when product is exempt' do
        let(:traits) { %i[exempt imported] }

        it { is_expected.to eq(50.00) }
      end

      context 'when product is not exempt' do
        let(:traits) { %i[not_exempt imported] }

        it { is_expected.to eq(150.00) }
      end
    end

    context 'when product is not imported' do
      context 'when product is exempt' do
        let(:traits) { %i[exempt not_imported] }

        it { is_expected.to eq(0.0) }
      end

      context 'when product is not exempt' do
        let(:traits) { %i[not_exempt not_imported] }

        it { is_expected.to eq(100.00) }
      end
    end

    context 'with edge cases' do
      context 'when value is 0' do
        let(:value) { 0.00 }

        it { is_expected.to eq(0.0) }
      end

      context 'when quantity is 0' do
        let(:quantity) { 0 }

        it { is_expected.to eq(0.0) }
      end

      context 'when value requires rounding' do
        let(:value) { 14.99 }
        let(:quantity) { 1 }

        it { is_expected.to eq(1.50) }
      end
    end
  end
end
