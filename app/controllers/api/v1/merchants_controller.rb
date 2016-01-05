class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml

  # before_action :authenticate!

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def create
    respond_with Merchant.create(merchant_params)
  end

  def update
    respond_with Merchant.update(params[:id], merchant_params)
  end

  def destroy
    respond_with Merchant.destroy(params[:id])
  end

  def random
    respond_with Merchant.random
  end

  def find
    if params[:name]
      respond_with Merchant.find_by(name: params[:name])
    end
  end

  def find_all
    if params[:name]
      respond_with Merchant.where(name: params[:name])
    end
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name)
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
