class Servey < ActiveRecord::Base
  attr_accessor :customer_id, :tab_id,:accept_or_decline, :address_confirmed, :agency_name,
                :applicant_residing_detail, :application_availibility_time, 
                :asset_seen_at_residence, :card_limit, :card_no, :carpet_area_in_sq_feet, :children,
                :comments_of_exteriors, :construction_of_residence, :credit_card, :customer_beaviour,
                :d_o_b, :date_of_visit, :ease_of_location, :educational_qualification, :expiry_date,
                :fh_code, :interior_condition, :issuing_bank, :landmark, :locality_of_residence,
                :marital_status, :name_and_stay_confirm, :name_plate_seen, :name_varified_from,
                :neighbour_ref, :no_of_family_member_in_the_house, :no_of_family_members,:date_of_birth, 
                :person_contacted, :potrait_on_wall, :refer_to_bank, :relation_with_applicant,
                :residence_status, :spouse_working, :spouse_working_detail, :time_of_visit,
                :type_of_residence, :verifiers_remark, :working_member, :years_lived_at_current_address,
                :status,:customer_documents_attributes, :pancard_number, 
                :driving_licence_number, :electricity_acc_number, :address_proof_sighted


  serialize :name_varified_from
  DOCUMENTS_PATH = File.join(Rails.root, "public", "customer_documents")


  belongs_to :tab
  belongs_to :customer
  has_and_belongs_to_many :assets
  has_and_belongs_to_many :address_proofs
  has_many :customer_documents
  accepts_nested_attributes_for :customer_documents

end
