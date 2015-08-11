require 'rails_helper'

RSpec.describe HatchesController, type: :controller do

  describe "GET #inde" do
    it "returns http success" do
      get :inde
      expect(response).to have_http_status(:success)
    end
  end

end
