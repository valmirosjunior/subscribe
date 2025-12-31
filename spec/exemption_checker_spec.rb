require 'spec_helper'
require 'exemption_checker'

RSpec.describe ExemptionChecker do
  describe '.exempt?' do
    subject { described_class.exempt?(product_name) }

    context 'when product is a book' do
      let(:product_name) { 'book' }

      it { is_expected.to be true }

      context 'with plural form' do
        let(:product_name) { 'books' }

        it { is_expected.to be true }
      end

      context 'with uppercase' do
        let(:product_name) { 'BOOK' }

        it { is_expected.to be true }
      end

      context 'with mixed case' do
        let(:product_name) { 'Book' }

        it { is_expected.to be true }
      end
    end

    context 'when product is food' do
      let(:product_name) { 'chocolate' }

      it { is_expected.to be true }

      context 'with plural form' do
        let(:product_name) { 'chocolates' }

        it { is_expected.to be true }
      end

      context 'with uppercase' do
        let(:product_name) { 'CHOCOLATE' }

        it { is_expected.to be true }
      end
    end

    context 'when product is medical' do
      let(:product_name) { 'pills' }

      it { is_expected.to be true }

      context 'with uppercase' do
        let(:product_name) { 'PILLS' }

        it { is_expected.to be true }
      end
    end

    context 'when product is not exempt' do
      context 'with music CD' do
        let(:product_name) { 'music CD' }

        it { is_expected.to be false }
      end

      context 'with perfume' do
        let(:product_name) { 'perfume' }

        it { is_expected.to be false }
      end
    end

    context 'with edge cases' do
      context 'when product name is nil' do
        let(:product_name) { nil }

        it { is_expected.to be false }
      end

      context 'when product name is empty' do
        let(:product_name) { '' }

        it { is_expected.to be false }
      end

      context 'when product name has extra whitespace' do
        let(:product_name) { '  book  ' }

        it { is_expected.to be true }
      end
    end
  end
end
