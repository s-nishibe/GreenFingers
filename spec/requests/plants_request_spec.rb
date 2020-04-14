require 'rails_helper'

RSpec.describe "Plants", type: :request do

  describe "GET /edit" do
    it "returns http success" do
      get "/plants/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
