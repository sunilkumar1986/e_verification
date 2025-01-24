class CoApplicantServey < ActiveRecord::Base
  attr_accessor :co_applicant_id, :tab_id,:accept_or_decline, :address_confirmed, :agency_name,
                :applicant_residing_detail, :application_availibility_time,
                :asset_seen_at_residence, :card_limit, :card_no, :carpet_area_in_sq_feet, :children,
                :comments_of_exteriors, :construction_of_residence, :credit_card, :customer_beaviour,
                :d_o_b, :date_of_visit, :ease_of_location, :educational_qualification, :expiry_date,
                :fh_code, :interior_condition, :issuing_bank, :landmark, :locality_of_residence,
                :marital_status, :name_and_stay_confirm, :name_plate_seen, :name_varified_from,
                :neighbour_ref, :no_of_family_member_in_the_house, :no_of_family_members,
                :person_contacted, :potrait_on_wall, :refer_to_bank, :relation_with_applicant,
                :residence_status, :spouse_working, :spouse_working_detail, :time_of_visit,:date_of_birth,
                :type_of_residence, :verifiers_remark, :working_member, :years_lived_at_current_address,
                :status,:co_applicant_documents_attributes, :pancard_number, :driving_licence_number, :electricity_acc_number

  serialize :name_varified_from
  belongs_to :co_applicant
  has_many :co_applicant_documents
  accepts_nested_attributes_for :co_applicant_documents#,  :reject_if => :all_blank, :allow_destroy => true

  has_attached_file :photo,
     :styles => {
       :media => "64x64",
       :thumb=> "100x100",
       :small  => "400x400" }

end
