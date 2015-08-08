class Contact < ActiveRecord::Base
  validates :first_name, :last_name, :phone, :email, presence: true
  validates_length_of :first_name, :last_name, :minimum => 3, :maximum => 35
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :email, uniqueness: { case_sensitive: false }
end

