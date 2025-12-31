require_relative 'input_parser'
require_relative 'tax_calculator'

class ReceiptGenerator
  class << self
    def generate(lines)
      output = []
      total_taxes = 0.0
      total = 0.0

      lines.each do |line|
        product = InputParser.parse_as_product(line)
        next unless product

        tax = TaxCalculator.new(product).calculate
        price_with_tax = product.subtotal + tax

        output << "#{product.quantity} #{product.description}: #{format_price(price_with_tax)}"
        total_taxes += tax
        total += price_with_tax
      end

      output << "Sales Taxes: #{format_price(total_taxes)}"
      output << "Total: #{format_price(total)}"
      output.join("\n")
    end

    private

    def format_price(price)
      format('%.2f', price)
    end
  end
end
