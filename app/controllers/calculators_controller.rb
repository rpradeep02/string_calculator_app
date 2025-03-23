class CalculatorsController < ApplicationController
  def index
  end

  def calculate
    @numbers = (params[:numbers] || "").gsub("\\n", "\n")
    Rails.logger.info "🚨 Submitted numbers param: #{@numbers.inspect}"

    begin
      @result = StringCalculator.add(@numbers)
    rescue => e
      Rails.logger.error "❌ Calculator error: #{e.message}"
      @error = e.message
    end

    render :index
  end



  def add
    numbers = (params[:numbers] || "").gsub("\\n", "\n")
    result = StringCalculator.add(numbers)
    render json: { result: result }
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
