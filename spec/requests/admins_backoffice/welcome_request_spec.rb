require 'rails_helper'

RSpec.describe "AdminsBackoffice::Welcomes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins_backoffice/welcome/index"
      expect(response).to have_http_status(:success)
    end
  end

end
