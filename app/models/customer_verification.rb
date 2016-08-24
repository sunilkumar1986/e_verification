class CustomerVerification < ActiveRecord::Base
  attr_accessible :customer_id, :tab_id, :user_id, :verify_co_applicant_address_1, :verify_co_applicant_address_2
  belongs_to :customer
  belongs_to :work_servey
  belongs_to :co_applicant
  belongs_to :co_applicant_work_detail
  belongs_to :tab
  validates_presence_of :tab_id
  scope :submitted, joins(:customer).where('customers.status =?', 'submitted')
end
