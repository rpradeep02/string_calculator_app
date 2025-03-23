require 'rails_helper'

RSpec.describe "Calculators", type: :request do
  describe "GET /add" do
    it "returns http success" do
      get "/calculators/add"
      expect(response).to have_http_status(:success)
    end
  end

end
