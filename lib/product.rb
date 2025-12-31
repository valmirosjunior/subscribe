require_relative 'exemption_checker'

class Product
  attr_reader :description, :value, :quantity, :imported

  def initialize(description, value, quantity, imported)
    @description = description
    @value = value
    @quantity = quantity
    @imported = imported
  end

  def subtotal
    value * quantity
  end
end
