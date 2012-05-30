class Landlord < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :hide_email
  has_many :properties
  belongs_to :user
end