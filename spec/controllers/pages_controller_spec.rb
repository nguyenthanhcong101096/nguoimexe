require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #page_404" do
    it "returns http success" do
      get :page_404
      expect(response).to have_http_status(:success)
    end
  end

end
