class CalculatorsController < ApplicationController
  def index
  end

  def calculate
    @numbers = params[:numbers] || ""
    begin
      @result = StringCalculator.add(@numbers)
    rescue => e
      @error = e.message
    end
    render :index
  end


  def add
    numbers = params[:numbers] || ""
    result = StringCalculator.add(numbers)
    render json: { result: result }
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
