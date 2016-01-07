class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
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

end
