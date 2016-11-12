require 'rails_helper'

RSpec.describe StatisticsController, type: :controller do

  describe "GET #plot" do
    it "returns http success" do
      get :plot
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #cv" do
    it "returns http success" do
      get :cv
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #list" do
    it "returns http success" do
      get :list
      expect(response).to have_http_status(:success)
    end
  end

end
