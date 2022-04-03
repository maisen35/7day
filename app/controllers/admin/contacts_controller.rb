class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @contacts = Contact.page(params[:page]).per(10)
    @contact_normal = Contact.where(subject: 'normal').page(params[:page]).per(10)
    @contact_report = Contact.where(subject: 'report').page(params[:page]).per(10)
    @contact_other = Contact.where(subject: 'other').page(params[:page]).per(10)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
  end

  private

  def contact_params
    params.require(:contact).permit(:check)
  end
end
