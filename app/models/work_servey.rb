class WorkServey < ActiveRecord::Base
  attr_accessor :customer_id, :pincode_id, :servey_id, :office_address, :name_and_employee_confirm,
                  :application_designation,:date_of_visit, :time_of_visit, :person_met,:applicant_designation,
                  :designation_of_person_met, :telephone_number, :ext_number, :mobile_number, :number_of_years_in_present_employment,
                  :visiting_card_obtained, :name_of_the_company, :type_of_business, :nature_of_business, :nob_in_detail,
                  :office_ownership, :no_of_employees, :no_of_branches, :average_monthly_turn_over, :no_of_customer_per_date,
                  :type_of_job, :working_as, :job_transferable, :salary_drawn, :no_of_years_worked, :board_seen,
                  :name_verified_from, :type_of_office, :locality_of_office, :construction_of_office, :exterior, :interior, :office_area,
                  :ease_of_location, :no_of_employees_sighted, :no_of_customer_seen, :political_party, :no_of_item_seen,
                  :verifier_remark, :positive, :refer_to_bank, :user_id, :verifier_signature, :status, :business_id, :tab_id,
                  :activity_level, :company_name_new, :department_id, :new_department_name

  serialize :name_verified_from

  attr_accessor :business_documents_attributes

  belongs_to :customer
  belongs_to :pincode
  belongs_to :business
  belongs_to :department
  has_one :work_servey_verification

  has_many :business_documents
  accepts_nested_attributes_for :business_documents, :allow_destroy => true



  geocoded_by :office_address
  after_validation :geocode, :if => :office_address_changed?

  def full_address
   [address, country_state, country_name].compact.join(', ')
  end

  include Workflow

workflow_column :status

  workflow do

    state :ready_for_verification do
      event :submit, :transitions_to => :submitted
    end

    state :submitted do
      event :progress, :transitions_to => :awaiting_to_get_verified
    end

    state :awaiting_to_get_verified do
      event :accept, :transitions_to => :verified
    end

    state :verified do
      event :re_indicated, :transitions_to => :ready_for_verification
      event :submitted, :transitions_to => :verified_with_changes
    end

  end

NAME_VERIFIED = %w[ colleage receptionist security others]








end
