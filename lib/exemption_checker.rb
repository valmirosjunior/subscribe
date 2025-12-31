class ExemptionChecker
  EXEMPT_CATEGORIES = {
    books: ['book'],
    food: ['chocolate'],
    medical: ['pills']
  }.freeze

  def self.exempt?(product_name)
    return false if product_name.nil? || product_name.empty?

    normalized_name = product_name.downcase

    EXEMPT_CATEGORIES.values.flatten.any? do |keyword|
      normalized_name.include?(keyword)
    end
  end
end
