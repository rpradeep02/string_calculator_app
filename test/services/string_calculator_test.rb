require 'test_helper'

class StringCalculatorTest < ActiveSupport::TestCase
  test "returns 0 for an empty string" do
    assert_equal 0, StringCalculator.add("")
  end

  test "returns the number for a single number" do
    assert_equal 1, StringCalculator.add("1")
  end

  test "returns the sum for two numbers separated by a comma" do
    assert_equal 6, StringCalculator.add("1,5")
  end

  test "returns the sum for multiple numbers" do
    assert_equal 10, StringCalculator.add("1,2,3,4")
  end

  test "handles newlines as delimiters" do
    assert_equal 6, StringCalculator.add("1\n2,3")
  end

  test "supports a custom delimiter" do
    assert_equal 3, StringCalculator.add("//;\n1;2")
  end

  test "raises an exception when negative numbers are present" do
    error = assert_raises(RuntimeError) { StringCalculator.add("1,-2,3,-4") }
    assert_equal "negative numbers not allowed: -2, -4", error.message
  end
end
