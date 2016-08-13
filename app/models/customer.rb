class Customer < ActiveRecord::Base
  attr_accessible :applicant_name, :application_ref_no, :latitude, :longitude,
                  :gmaps, :state, :pincode_id, :country_state, :country_city,
                  :country_name, :slug, :address, :degree_name, :agency_name,
                  :fh_code, :landmark, :d_o_b, :photo_required, :contact_number, :application_status,
                  :branch_id, :branch_code, :client_id, :area_name, :city_id, :no_verifcation, :status, 
                  :city_name, :message, :pincode_number, :documents_attributes, :document

  # validates_presence_of :application_ref_no, :applicant_name, :address, :fh_code, :branch_id, :client_id, :branch_code
  validates_uniqueness_of :application_ref_no, :fh_code, :contact_number

  serialize :asset_seen_at_residence

  extend FriendlyId
  friendly_id :applicant_name, use: :slugged

  scope :inprogress, where(:status => 'awaiting_to_get_verified')
  scope :inqueue , where(:status => 'ready_for_verification')
  scope :verified, where(:status => 'verified')
  scope :submitted, where(:status => 'submitted')
  scope :without_status, lambda{|customer| customer ? {:conditions => ["status != ?", 'ready_for_verification']} : {} }

  has_one :servey, :dependent => :destroy
  has_one :business, :dependent => :destroy
  has_one :customer_verification, :dependent => :destroy
  has_many :customer_documents, :dependent => :destroy
  has_one :co_applicant, :dependent => :destroy
  has_one :co_applicant_business, :dependent => :destroy
  has_one :co_applicant_work_detail, :dependent => :destroy
  belongs_to :pincode
  belongs_to :tab
  belongs_to :branch
  belongs_to :client
  has_and_belongs_to_many :assets
  has_and_belongs_to_many :office_assets
  has_and_belongs_to_many :address_proofs

  has_many :documents
  accepts_nested_attributes_for :documents, :reject_if => :all_blank, :allow_destroy => true

  attr_accessible :customer_documents_attributes, :dependent_destroy => true
  accepts_nested_attributes_for :customer_documents, :allow_destroy => true
  accepts_nested_attributes_for :customer_documents, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  geocoded_by :full_address
  after_validation :geocode, :if => :address_changed?

  def full_address
   [address, country_state, country_city, country_name].compact.join(', ')
  end

  include Workflow

workflow_column :status

  workflow do

    state :ready_for_verification do
      event :submit, :transitions_to => :submitted
    end

    state :submitted do
      event :progress, :transitions_to => :awaiting_to_get_verified
      event :reset, :transitions_to => :ready_for_verification
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

	TYPE_OF_RESIDENCE= %w[independence-house multitanent-house temparory-shed bunglow/row-house flat standing-chawl janta-flat-hutment sitting-chawl hostel others]
	RESIDENCE_STATUS= %w[ selfowned owned-by-parnets rented company-accomodation paying-guest owned-by-friend owned-by-relative lodging ]
	EDUCATIONAL_QUALIFICATION = %w[professional post_graduate graduate undergraduate others]
	MARTIAL_STATUS= %w[single married divorced]
	BEHAVIOUR = %w[ polite rude]
	NEIGHBOUR_REFERENCE = %w[positive negative]
	NAME_VERIFIED = %w[ Application-no.(Signed-on-both-Side) Bank-Maudute(signed) Pancard-copy(Signed-Photocopy) Cheque-Leaf(cancelled-Original) Address-Proof(Signed-Copy) Income-Proof]
	RESIDENCE_LOCALITY = %w[posh_locality village_area upper_middle_class lower_middle_class slums others ]
	EASE_OF_LOCATION = %w[easy difficult unreachable]
	ASSET_SEEN = %w[car two_Wheeler aircon television refrigerator music_system pc]
	INTERIORS = %w[sofa clean painted carpeted curtains]
	EXTERIORS = %w[fenced/compaund-wall elevator others]
	CONSTRUCTION = %w[ pukka semi-pukka temperory carpark garden security building-wall]


#	def self.search(search)
#		if search
#			where('applicant_name iLIKE ?', "%#{search}%")
#		else
#			scoped
#		end
#	end

# def self.search(search)
#  search_condition = "%" + search + "%"
#  find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
# end


end
