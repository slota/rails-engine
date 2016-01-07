class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml, :html

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def random
    respond_with Merchant.random
  end

  def invoices
    respond_with Merchant.find_by(id: params[:id]).invoices
  end

  def items
    respond_with Merchant.find_by(id: params[:id]).items
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def most_items
    respond_with Merchant.most_items(merchant_params["quantity"].to_i).reverse
  end

  def revenue
    respond_with Merchant.find_by(id: params[:id]).revenue(merchant_params)
  end

  def favorite_customer
    respond_with Merchant.find_by(merchant_params).favorite_customer
  end

  def revenue_by_date
    respond_with Merchant.all.revenue_by_date(params[:date])
  end


  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at, :quantity, :date)
  end

  # def authenticate!
  #   authenticate_or_request_with_http_basic('Please authenticate to use my API') do |email, password|
  #     user = User.find_by(email: email)
  #
  #     if user && user.authenticate(password)
  #       true
  #     else
  #       head :unauthorized
  #     end
  #   end
  # end

end
