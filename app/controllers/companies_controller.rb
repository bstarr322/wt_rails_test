class CompaniesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Company.all
  end

  def new
  	render json: Company.new
  end

  def create
  	company = Company.create(:name => params[:name])
  	render json: company
  end
end
