require 'rails_helper'

RSpec.describe Contact, type: :model do
  before do
    @contact = Contact.new(
      first_name: 'Eric',
      last_name:  'Fransen',
      address: '123 Street',
      city: 'Denver',
      state_province: 'CO',
      country: 'USA',
      zip: 80211,
      phone: '555-555-5555',
      email: 'eric@me.com'
    )
  end
 
  subject { @contact }
 
  it { should respond_to(:first_name) }
  it { should be_valid }
 
  describe "when name is not present" do
    before { @contact.first_name = "   " }
    it { should_not be_valid }
  end

  describe "when first name is too short" do
    before { @contact.first_name = "bo" }
    it { should_not be_valid }
  end

  describe "when last name is too short" do
    before { @contact.last_name = "bo" }
    it { should_not be_valid }
  end
 
  describe "when email is already taken" do
    before do
      contact_with_same_email = @contact.dup
      contact_with_same_email.email = @contact.email.upcase
      contact_with_same_email.save
    end
 
    it { should_not be_valid }
  end
end
