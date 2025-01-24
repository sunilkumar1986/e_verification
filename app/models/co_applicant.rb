class CoApplicant < ActiveRecord::Base
  attr_accessor :document_required, :address, :name,:status,
                  :pincode_id, :customer_id, :status,
                  :agency_name, :application_ref_no,
                  :fh_code, :applicant_name, :landmark,:application_status,
                  :country_name, :country_state, :country_city,
                  :client_id, :branch_id, :branch_code, :area_name, :city_id

  has_one :co_applicant_work_detail
  has_one :co_applicant_verification, :dependent => :destroy
  belongs_to :customer
  has_one :co_applicant_business
  belongs_to :pincode
  belongs_to :tab
  has_one :co_applicant_servey
  belongs_to :branch
  belongs_to :client
  belongs_to :city
  validates_presence_of :application_ref_no, :applicant_name, :address, :fh_code
  validates_uniqueness_of :application_ref_no, :fh_code

  has_many :co_applicant_documents
  accepts_nested_attributes_for :co_applicant_documents, :allow_destroy => true
  # scope :without_status, lambda{|customer| customer ? {:conditions => ["status != ?", 'ready_for_verification']} : {} }
  scope :without_status, -> (status) { where.not(status: status) }

  scope :submitted, -> { where(status: 'submitted') }
 extend FriendlyId
 friendly_id :applicant_name, use: :slugged

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
