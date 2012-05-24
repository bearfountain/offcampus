class Landlord < ActiveRecord::Base
  attr_accessible :name, :email, :phone
  has_many :properties
  belongs_to :user
end