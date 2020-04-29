require 'rails_helper'

RSpec.describe CompaniesController do

  describe "GET index" do

    it "assigns @companies" do
      company = Company.create(name: 'Test', zip_code: '85004', phone: '123-456-6789', email: "test@getmainstreet.com")
      get :index
      expect(assigns(:companies)).to eq([company])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "has status code :ok" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
