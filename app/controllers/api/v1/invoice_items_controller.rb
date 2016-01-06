class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  # before_action :authenticate!

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def create
    respond_with InvoiceItem.create(invoice_item_params)
  end

  def update
    respond_with InvoiceItem.update(params[:id], invoice_item_params)
  end

  def destroy
    respond_with InvoiceItem.destroy(params[:id])
  end

  def random
    respond_with InvoiceItem.random
  end

  def invoice
    respond_with InvoiceItem.find_by(id: params[:id]).invoice
  end

  def item
    respond_with InvoiceItem.find_by(id: params[:id]).item
  end

  def find
    respond_with InvoiceItem.find_by(invoice_items_params)
  end

  def find_all
    respond_with InvoiceItem.where(invoice_items_params)
  end

  private

  def invoice_items_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
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
