class Api::V1::CustomersController < ApplicationController
  respond_to :json, :xml

  # before_action :authenticate!

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def create
    respond_with Customer.create(customer_params)
  end

  def update
    respond_with Customer.update(params[:id], customer_params)
  end

  def destroy
    respond_with Customer.destroy(params[:id])
  end

  def find
    if params[:first_name]
      respond_with Customer.find_by(first_name: params[:first_name])
    elsif params[:last_name]
      respond_with Customer.find_by(last_name: params[:last_name])
    end
  end

  def find_all
    if params[:first_name]
      respond_with Customer.where(first_name: params[:first_name])
    elsif params[:last_name]
      respond_with Customer.where(last_name: params[:last_name])
    end
  end

  def random
    respond_with Customer.random
  end

  private

  def customer_params
    params.require(:Customer).permit(:first_name, :last_name)
  end
  #
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
