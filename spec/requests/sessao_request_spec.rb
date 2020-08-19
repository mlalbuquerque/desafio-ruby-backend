require 'rails_helper'

RSpec.describe "Sessaos", type: :request do

  describe "GET /callback" do
    it "returns http success" do
      get "/sessao/callback"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /sair" do
    it "returns http success" do
      get "/sessao/sair"
      expect(response).to have_http_status(:success)
    end
  end

end
