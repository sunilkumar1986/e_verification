class Business < ActiveRecord::Base
 attr_accessor :address, :agency_name, :applicant_name, :application_ref_no,:status,
                 :country_city, :country_name, :country_state, :date_of_birth,
                 :document_required, :fh_code, :landmark, :latitude, :longitude, :application_status,
                 :pincode_id, :slug, :status, :customer_id, :company_name, :pan_number,:emp_code, :department_id,
                 :client_id, :branch_id, :branch_code, :city_id, :area_name


 validates_presence_of :application_ref_no, :applicant_name, :address, :fh_code
 validates_uniqueness_of :application_ref_no, :fh_code

 belongs_to :customer, :dependent => :destroy
 belongs_to :pincode
 has_one :business_verification, :dependent => :destroy
 has_one :work_servey, :dependent => :destroy
 has_many :business_documents, :dependent => :destroy
 has_and_belongs_to_many :b_documents
 belongs_to :department
 belongs_to :branch
 belongs_to :client
 extend FriendlyId
 friendly_id :applicant_name, use: :slugged
 # scope :without_status, lambda{|customer| customer ? {:conditions => ["status != ?", 'ready_for_verification']} : {} }
 scope :without_status, -> (id) { where.not(status: 'ready_for_verification') }
 scope :submitted, -> { where(status: "submitted") }
 geocoded_by :full_address
  after_validation :geocode, :if => :address_changed?

 def full_address
  [address, country_city, country_state, country_name].compact.join(', ')
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


 def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |customer|
      csv << customer.attributes.values_at(*column_names)
    end
  end
 end




end
