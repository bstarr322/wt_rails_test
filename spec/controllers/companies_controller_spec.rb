require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe 'GET index' do
    # let!(:companies) { create_list :company, 5 }
    before :each do
      Company.create(:name => 'Microsoft')
      Company.create(:name => 'Apple')
      Company.create(:name => 'Dell')
      Company.create(:name => 'Disney')
      Company.create(:name => 'UkrZaliznitsya')
    end

    it 'return status 200' do
      get :index
      expect(response).to have_http_status :ok
    end

    it 'return document types' do
      get :index
      expect(json.size).to eq 5
    end
  end

  describe "GET #new" do
    it "return a new company" do 
      get :new
      expect(response).to have_http_status :ok
    end 
  end

  describe "POST #create" do
    it "return a created company" do 
      expect { post :create, {:name => 'Google'} }.to change(Company, :count).by(1) 
    end
  end
end
