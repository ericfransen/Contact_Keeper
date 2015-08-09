class ContactsController < ApplicationController
  respond_to :html, :json

  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

  before_action :find_contact, only: [:show, :update, :destroy]

  def index
    @contacts = Contact.all
    respond_with @contacts
  end

  def show
    respond_with @contact
  end

  def create
    @contact = Contact.create(contact_params)
    respond_with @contact
  end

  def update
    @contact.update_attributes!(contact_params)
    respond_with @contact
  end

  def destroy
    @contact.destroy
    respond_with @contact.destroy
  end

  private

  def find_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact)
      .permit(:first_name,
              :last_name,
              :address,
              :city,
              :state_province,
              :country,
              :zip,
              :phone,
              :email
             )
  end
end
