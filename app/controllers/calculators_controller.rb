class CalculatorsController < ApplicationController
  def add
    numbers = params[:numbers] || ""
    result = StringCalculator.add(numbers)
    render json: { result: result }
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
