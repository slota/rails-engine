class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  # before_action :authenticate!

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def create
    respond_with Item.create(item_params)
  end

  def update
    respond_with Item.update(params[:id], item_params)
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end

  def random
    respond_with Item.random
  end

  def invoice_items
    respond_with Item.find_by(id: params[:id]).invoice_items
  end

  def merchant
    respond_with Item.find_by(id: params[:id]).merchant
  end





  def find
    if params[:name]
      respond_with Item.find_by(name: params[:name])
    elsif params[:description]
      respond_with Item.find_by(description: params[:description])
    elsif params[:unit_price]
      respond_with Item.find_by(unit_price: params[:unit_price])
    end
  end

  def find_all
    if params[:name]
      respond_with Item.where(name: params[:name])
    elsif params[:description]
      respond_with Item.where(description: params[:description])
    elsif params[:unit_price]
      respond_with Item.where(unit_price: params[:unit_price])
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
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
