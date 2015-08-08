class ContactsController < ApplicationController
  respond_to :html, :json

  before_action :find_contact, only: [:show, :update, :destroy]

  def index
    respond_with Contact.all
  end

  def show
    respond_with @contact
  end

  def create
    respond_with @contact = Contact.create(contact_params)
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
    Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name,
                                    :last_name,
                                    :address,
                                    :city,
                                    :state,
                                    :country,
                                    :zip,
                                    :phone,
                                    :email
                                   )
  end
end
