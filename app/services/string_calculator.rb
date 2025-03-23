class StringCalculator
  def self.add(numbers)
    return 0 if numbers.nil? || numbers.strip.empty?

    # Clean quotes from input
    numbers = numbers.gsub(/^['"]|['"]$/, '')

    delimiter = /,|\n/

    # Check for custom delimiter
    if numbers.start_with?("//")
      header, body = numbers.split("\n", 2)

      if body.nil?
        raise "Invalid input format. Expected a newline after custom delimiter."
      end

      custom_delimiter = header[2..]
      delimiter = Regexp.union(custom_delimiter)
      numbers = body
    end

    num_array = numbers.split(delimiter).map(&:to_i)

    negatives = num_array.select { |n| n < 0 }
    if negatives.any?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    num_array.sum
  end
end
