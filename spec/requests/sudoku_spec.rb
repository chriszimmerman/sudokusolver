require 'rails_helper'

RSpec.describe "Sudokus", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/sudoku/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post "/sudoku/create", :params => { puzzle: [] }
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/sudoku/show"
      expect(response).to have_http_status(:success)
    end
  end

end
