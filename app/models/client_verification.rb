class ClientVerification < ActiveRecord::Base
  attr_accessor :customer_id, :co_applicant_business_id, :tab_id, :user_id
  belongs_to :co_applicant_business
  belongs_to :tab
  validates_presence_of :tab_id
end
