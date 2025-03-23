class StringCalculator
  def self.add(numbers)
    return 0 if numbers.strip.empty?

    numbers = numbers.gsub(/^['"]|['"]$/, '')

    delimiter = /[,\n]/

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      custom_delimiter = header[2..]
      delimiter = Regexp.union(custom_delimiter)
    end

    nums = numbers.split(delimiter).map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    if negatives.any?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    nums.sum
  end
end
