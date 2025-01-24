class CoApplicantWorkDetail < ActiveRecord::Base
  attr_accessor :co_applicant_id,:customer_id, :pincode_id, :servey_id, :office_address, :name_and_employee_confirm,
                  :application_designation,:date_of_visit, :time_of_visit, :person_met,:applicant_designation,
                  :designation_of_person_met, :telephone_number, :ext_number, :mobile_number, :number_of_years_in_present_employment,
                  :visiting_card_obtained, :name_of_the_company, :type_of_business, :nature_of_business, :nob_in_detail,
                  :office_ownership, :no_of_employees, :no_of_branches, :average_monthly_turn_over, :no_of_customer_per_date,
                  :type_of_job, :working_as, :job_transferable, :salary_drawn, :no_of_years_worked, :board_seen, :activity_level,
                  :name_verified_from, :type_of_office, :locality_of_office, :construction_of_office, :exterior, :interior, :office_area,
                  :ease_of_location, :no_of_employees_sighted, :no_of_customer_seen, :political_party, :no_of_item_seen,
                  :verifier_remark, :positive, :refer_to_bank, :user_id, :verifier_signature, :status, :company_name_new,
                  :co_applicant_business_id, :business_id, :tab_id, :co_applicant_business_documents_attributes

  belongs_to :customer
  belongs_to :co_applicant
  belongs_to :co_applicant_business
  belongs_to :department
  has_many :co_applicant_business_documents
  accepts_nested_attributes_for :co_applicant_business_documents

  geocoded_by :office_address
  after_validation :geocode, :if => :office_address_changed?

end
