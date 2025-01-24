class CoApplicantVerification < ActiveRecord::Base
  attr_accessor :co_applicant_id, :customer_id, :tab_id, :user_id
  belongs_to :co_applicant
  belongs_to :tab
  belongs_to :co_applicant_business
  validates_presence_of :tab_id
end
