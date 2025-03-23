class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /[,\n]/

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      custom_delimiter = header[2..-1]
      delimiter = Regexp.union(custom_delimiter, ',', "\n")
    end

    nums = numbers.split(delimiter).map(&:to_i)

    nums.sum
  end
end
