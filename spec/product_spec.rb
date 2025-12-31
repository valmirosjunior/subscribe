require 'spec_helper'
require 'product'

RSpec.describe Product do
  subject { build(:product) }

  describe 'attributes' do
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:value) }
    it { is_expected.to respond_to(:quantity) }
    it { is_expected.to respond_to(:imported) }
    it { is_expected.to respond_to(:subtotal) }
  end

  describe '#subtotal' do
    subject { build(:product, value: 12.49, quantity: 2) }

    it 'calculates value * quantity' do
      expect(subject.subtotal).to eq(24.98)
    end
  end
end
