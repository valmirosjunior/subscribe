require_relative 'exemption_checker'

class TaxCalculator
  BASIC_TAX_RATE = 0.10
  IMPORT_DUTY_RATE = 0.05
  ROUNDING_FACTOR = 20

  attr_reader :product

  def initialize(product)
    @product = product
  end

  def calculate
    basic_tax + import_duty
  end

  private

  def basic_tax
    return 0 if ExemptionChecker.exempt?(product.description)

    calculate_tax(BASIC_TAX_RATE)
  end

  def import_duty
    return 0 unless product.imported

    calculate_tax(IMPORT_DUTY_RATE)
  end

  def calculate_tax(rate)
    tax_per_unit = product.value * rate
    rounded_per_unit = round_tax(tax_per_unit)
    rounded_per_unit * product.quantity
  end

  def round_tax(amount)
    (amount * ROUNDING_FACTOR).ceil / ROUNDING_FACTOR.to_f
  end
end
