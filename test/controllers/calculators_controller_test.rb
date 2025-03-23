require 'test_helper'

class CalculatorsControllerTest < ActionDispatch::IntegrationTest
  test "GET /add returns correct sum for valid numbers" do
    get add_url, params: { numbers: "1,2,3" }
    json_response = JSON.parse(response.body)
    assert_equal 6, json_response["result"]
  end

  test "GET /add returns 0 for an empty string" do
    get add_url, params: { numbers: "" }
    json_response = JSON.parse(response.body)
    assert_equal 0, json_response["result"]
  end

  test "GET /add returns the number itself if only one number" do
    get add_url, params: { numbers: "5" }
    json_response = JSON.parse(response.body)
    assert_equal 5, json_response["result"]
  end

  test "GET /add handles newlines between numbers" do
    get add_url, params: { numbers: "1\n2,3" }
    json_response = JSON.parse(response.body)
    assert_equal 6, json_response["result"]
  end

  test "GET /add supports custom delimiter" do
    get add_url, params: { numbers: "//;\n1;2;3" }
    json_response = JSON.parse(response.body)
    assert_equal 6, json_response["result"]
  end

  test "GET /add supports custom delimiter with only one number" do
    get add_url, params: { numbers: "//;\n7" }
    json_response = JSON.parse(response.body)
    assert_equal 7, json_response["result"]
  end

  test "GET /add returns error for negative numbers" do
    get add_url, params: { numbers: "1,-2,3" }
    json_response = JSON.parse(response.body)
    assert_response :unprocessable_entity
    assert_match /negative numbers not allowed/, json_response["error"]
  end

  test "GET /add returns error listing all negative numbers" do
    get add_url, params: { numbers: "-1,-3,-5" }
    json_response = JSON.parse(response.body)
    assert_response :unprocessable_entity
    assert_equal "negative numbers not allowed: -1, -3, -5", json_response["error"]
  end

  test "GET /add with large number of inputs" do
    input = (1..100).to_a.join(",")
    expected_sum = (1..100).sum
    get add_url, params: { numbers: input }
    json_response = JSON.parse(response.body)
    assert_equal expected_sum, json_response["result"]
  end

  test "GET /add returns correct sum for normal input" do
    get add_url, params: { numbers: "1,2,3" }
    json = JSON.parse(response.body)
    assert_equal 6, json["result"]
  end

  test "GET /add returns correct sum for single-quoted input" do
    get add_url, params: { numbers: "'1,2'" }
    json = JSON.parse(response.body)
    assert_equal 3, json["result"]
  end

  test "GET /add returns correct sum for double-quoted input" do
    get add_url, params: { numbers: "\"1,2\"" }
    json = JSON.parse(response.body)
    assert_equal 3, json["result"]
  end

  test "GET /add raises error for negative numbers" do
    get add_url, params: { numbers: "1,-2" }
    json = JSON.parse(response.body)
    assert_response :unprocessable_entity
    assert_match /negative numbers not allowed/, json["error"]
  end
end
