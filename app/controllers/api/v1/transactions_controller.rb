class Api::V1::TransactionsController < ApplicationController
  respond_to :json, :xml, :html

  # before_action :authenticate!

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def create
    respond_with Transaction.create(transaction_params)
  end

  def update
    respond_with Transaction.update(params[:id], transaction_params)
  end

  def destroy
    respond_with Transaction.destroy(params[:id])
  end

  def invoice
    respond_with Transaction.find_by(id: params[:id]).invoice
  end

  def random
    respond_with Transaction.random
  end

  def find
    respond_with Transaction.find_by(transaction_params)
  end

  def find_all
    respond_with Transaction.where(transaction_params)
  end

  private

  def transaction_params
    params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
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
