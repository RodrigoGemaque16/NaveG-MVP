require 'rails_helper'

RSpec.describe "AdminsBackoffice::Harbors", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins_backoffice/harbors/index"
      expect(response).to have_http_status(:success)
    end
  end

end
