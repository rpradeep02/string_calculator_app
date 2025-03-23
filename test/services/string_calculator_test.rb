require "test_helper"

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

  test "custom delimiter -" do
    assert_equal 7, StringCalculator.add("//-\n4-2-1")
  end

  test "raises error for negative number" do
    e = assert_raises(RuntimeError) { StringCalculator.add("1,-2,3") }
    assert_match /negative numbers not allowed: -2/, e.message
  end

  test "raises error for multiple negative numbers" do
    e = assert_raises(RuntimeError) { StringCalculator.add("-1,-2") }
    assert_equal "negative numbers not allowed: -1, -2", e.message
  end

  test "handles input wrapped in single quotes" do
    assert_equal 3, StringCalculator.add("'1,2'")
  end

  test "handles input wrapped in double quotes" do
    assert_equal 3, StringCalculator.add("\"1,2\"")
  end
end
