require 'rails_helper'

RSpec.describe "Drafts", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/drafts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/drafts/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /preview" do
    it "returns http success" do
      get "/drafts/preview"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/drafts/index"
      expect(response).to have_http_status(:success)
    end
  end

end
