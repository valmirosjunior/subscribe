require_relative 'product'

class InputParser
  def self.parse_as_product(line)
    return nil if line.nil? || line.strip.empty?

    match = line.match(/^(\d+)\s+(.+?)\s+at\s+(\d+\.\d{2})$/)
    return nil unless match

    quantity = match[1].to_i
    description = match[2].strip
    value = match[3].to_f
    imported = description.downcase.start_with?('imported')

    Product.new(description, value, quantity, imported)
  end
end
