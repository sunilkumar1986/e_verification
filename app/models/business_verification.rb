class BusinessVerification < ActiveRecord::Base
  attr_accessor :business_id, :customer_id, :tab_id, :user_id
  belongs_to :business
  belongs_to :tab
  validates_presence_of :tab_id
end
