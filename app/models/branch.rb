class Branch < ActiveRecord::Base
  validates_uniqueness_of :name, :branch_code
  attr_accessor :branch_code, :contact_person, :name, :client_id
  has_one :customer
  belongs_to :client
end
