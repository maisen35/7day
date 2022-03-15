class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @contacts = Contact.page(params[:page]).per(10)
  end

  def show
    @contact = Contact.find(params[:id])
  end
end
