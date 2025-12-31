require 'spec_helper'
require 'receipt_generator'

RSpec.describe ReceiptGenerator do
  describe '.generate' do
    subject { described_class.generate(input) }

    context 'with input 1' do
      let(:input) { ['2 book at 12.49', '1 music CD at 14.99', '1 chocolate bar at 0.85'] }

      it 'generates correct receipt' do
        expect(subject).to include('2 book: 24.98')
        expect(subject).to include('1 music CD: 16.49')
        expect(subject).to include('1 chocolate bar: 0.85')
        expect(subject).to include('Sales Taxes: 1.50')
        expect(subject).to include('Total: 42.32')
      end
    end

    context 'with input 2' do
      let(:input) { ['1 imported box of chocolates at 10.00', '1 imported bottle of perfume at 47.50'] }

      it 'generates correct receipt' do
        expect(subject).to include('1 imported box of chocolates: 10.50')
        expect(subject).to include('1 imported bottle of perfume: 54.65')
        expect(subject).to include('Sales Taxes: 7.65')
        expect(subject).to include('Total: 65.15')
      end
    end

    context 'with empty input' do
      let(:input) { [] }

      it 'returns only totals' do
        expect(subject).to include('Sales Taxes: 0.00')
        expect(subject).to include('Total: 0.00')
      end
    end

    context 'with invalid lines' do
      let(:input) { ['2 book at 12.49', 'invalid line', '1 music CD at 14.99'] }

      it 'skips invalid lines' do
        expect(subject).to include('2 book: 24.98')
        expect(subject).to include('1 music CD: 16.49')
      end
    end
  end
end
