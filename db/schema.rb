# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160813084341) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "address_proofs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "address_proofs_customers", :id => false, :force => true do |t|
    t.integer "address_proof_id"
    t.integer "customer_id"
  end

  create_table "address_proofs_serveys", :id => false, :force => true do |t|
    t.integer "address_proof_id"
    t.integer "servey_id"
  end

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "assets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "assets_customers", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "customer_id"
  end

  create_table "assets_serveys", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "servey_id"
  end

  create_table "attendences", :force => true do |t|
    t.integer  "user_id"
    t.datetime "login_time"
    t.datetime "logout_time"
    t.date     "login_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "b_documents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "b_documents_businesses", :id => false, :force => true do |t|
    t.integer "business_id"
    t.integer "b_document_id"
  end

  create_table "branches", :force => true do |t|
    t.string   "name"
    t.string   "branch_code"
    t.string   "contact_person"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "client_id"
  end

  create_table "business_documents", :force => true do |t|
    t.integer  "business_id"
    t.integer  "work_servey_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  create_table "business_verifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.integer  "business_id"
    t.integer  "tab_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "businesses", :force => true do |t|
    t.string   "application_ref_no"
    t.string   "agency_name"
    t.boolean  "document_required"
    t.string   "fh_code"
    t.string   "applicant_name"
    t.string   "application_status"
    t.string   "landmark"
    t.text     "address"
    t.string   "country_name"
    t.string   "country_state"
    t.string   "country_city"
    t.integer  "pincode_id"
    t.string   "slug"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "status"
    t.integer  "customer_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "company_name"
    t.string   "pan_number"
    t.string   "emp_code"
    t.integer  "department_id"
    t.string   "message"
    t.integer  "branch_id"
    t.integer  "client_id"
    t.string   "branch_code"
    t.string   "area_name"
    t.integer  "city_id"
  end

  add_index "businesses", ["applicant_name"], :name => "index_businesses_on_applicant_name", :unique => true
  add_index "businesses", ["application_ref_no"], :name => "index_businesses_on_application_ref_no", :unique => true
  add_index "businesses", ["customer_id"], :name => "index_businesses_on_customer_id", :unique => true
  add_index "businesses", ["fh_code"], :name => "index_businesses_on_fh_code", :unique => true
  add_index "businesses", ["status"], :name => "index_businesses_on_status"

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "client_verifications", :force => true do |t|
    t.integer  "co_applicant_business_id"
    t.integer  "tab_id"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "co_applicant_business_documents", :force => true do |t|
    t.integer  "co_applicant_business_id"
    t.integer  "co_applicant_work_detail_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "co_applicant_businesses", :force => true do |t|
    t.string   "application_ref_no"
    t.string   "agency_name"
    t.boolean  "document_required"
    t.string   "fh_code"
    t.string   "applicant_name"
    t.string   "application_status"
    t.string   "landmark"
    t.text     "address"
    t.string   "country"
    t.string   "city"
    t.string   "state"
    t.integer  "pincode_id"
    t.string   "slug"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "status"
    t.integer  "customer_id"
    t.string   "company_name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "pan_number"
    t.string   "emp_code"
    t.integer  "department_id"
    t.string   "message"
    t.integer  "branch_id"
    t.integer  "client_id"
    t.string   "branch_code"
    t.string   "area_name"
    t.integer  "city_id"
  end

  create_table "co_applicant_documents", :force => true do |t|
    t.integer  "co_applicant_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "co_applicant_servey_id"
  end

  create_table "co_applicant_serveys", :force => true do |t|
    t.integer  "co_applicant_id"
    t.integer  "tab_id"
    t.boolean  "address_confirmed"
    t.boolean  "name_and_stay_confirm"
    t.date     "date_of_visit"
    t.time     "time_of_visit"
    t.string   "person_contacted"
    t.string   "relation_with_applicant"
    t.integer  "years_lived_at_current_address"
    t.string   "residence_status"
    t.string   "educational_qualification"
    t.string   "marital_status"
    t.integer  "no_of_family_members"
    t.integer  "working_member"
    t.integer  "children"
    t.boolean  "spouse_working"
    t.string   "spouse_working_detail"
    t.boolean  "name_plate_seen"
    t.boolean  "credit_card"
    t.string   "card_no"
    t.float    "card_limit"
    t.string   "issuing_bank"
    t.date     "expiry_date"
    t.string   "customer_beaviour"
    t.string   "neighbour_ref"
    t.string   "name_varified_from"
    t.string   "type_of_residence"
    t.string   "locality_of_residence"
    t.string   "ease_of_location"
    t.string   "construction_of_residence"
    t.string   "comments_of_exteriors"
    t.float    "carpet_area_in_sq_feet"
    t.string   "interior_condition"
    t.string   "asset_seen_at_residence"
    t.boolean  "potrait_on_wall"
    t.boolean  "applicant_residing_detail"
    t.string   "application_availibility_time"
    t.integer  "no_of_family_member_in_the_house"
    t.text     "verifiers_remark"
    t.boolean  "accept_or_decline"
    t.string   "refer_to_bank"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "photo_required"
    t.date     "date_of_birth"
    t.string   "pancard_number"
    t.string   "passport_number"
    t.string   "driving_licence_number"
    t.string   "electricity_acc_number"
  end

  create_table "co_applicant_verifications", :force => true do |t|
    t.integer  "co_applicant_id"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.integer  "tab_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "co_applicant_work_details", :force => true do |t|
    t.integer  "co_applicant_business_id"
    t.string   "office_address",                        :default => "N/A"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "name_and_employee_confirm"
    t.string   "applicant_designation",                 :default => "N/A"
    t.date     "date_of_visit"
    t.time     "time_of_visit"
    t.string   "person_met"
    t.string   "designation_of_person_met"
    t.string   "telephone_number"
    t.string   "ext_number"
    t.string   "mobile_number"
    t.integer  "number_of_years_in_present_employment"
    t.boolean  "visiting_card_obtained"
    t.string   "name_of_the_company"
    t.string   "type_of_business"
    t.string   "nature_of_business"
    t.string   "nob_in_detail"
    t.string   "office_ownership"
    t.string   "no_of_employees"
    t.string   "no_of_branches"
    t.float    "average_monthly_turn_over"
    t.integer  "no_of_customer_per_date"
    t.string   "type_of_job"
    t.string   "working_as"
    t.boolean  "job_transferable"
    t.float    "salary_drawn"
    t.float    "no_of_years_worked"
    t.boolean  "board_seen"
    t.string   "name_verified_from"
    t.string   "type_of_office"
    t.string   "locality_of_office"
    t.string   "construction_of_office"
    t.string   "exterior"
    t.string   "interior"
    t.float    "office_area"
    t.string   "ease_of_location"
    t.string   "activity_level"
    t.integer  "no_of_employees_sighted"
    t.integer  "no_of_customer_seen"
    t.boolean  "political_party"
    t.string   "no_of_item_seen"
    t.text     "verifier_remark"
    t.boolean  "positive"
    t.string   "refer_to_bank"
    t.integer  "user_id"
    t.integer  "verifier_signature"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.integer  "co_applicant_id"
    t.integer  "pincode_id"
    t.integer  "customer_id"
    t.string   "status"
    t.boolean  "document_required"
    t.string   "company_name"
    t.string   "landmark"
    t.string   "city"
    t.string   "state"
    t.integer  "application_ref_no"
    t.string   "company_name_new"
    t.integer  "tab_id"
  end

  create_table "co_applicants", :force => true do |t|
    t.string   "applicant_name"
    t.string   "agency_name"
    t.boolean  "document_required"
    t.string   "fh_code"
    t.string   "landmark"
    t.string   "country_name"
    t.string   "country_state"
    t.string   "country_city"
    t.string   "slug"
    t.string   "status"
    t.integer  "customer_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "application_status"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "contact_number"
    t.integer  "application_ref_no"
    t.integer  "pincode_id"
    t.string   "state"
    t.date     "d_o_b"
    t.string   "message"
    t.integer  "branch_id"
    t.integer  "client_id"
    t.string   "branch_code"
    t.string   "area_name"
    t.integer  "city_id"
  end

  create_table "customer_documents", :force => true do |t|
    t.integer  "customer_id"
    t.string   "photo"
    t.string   "photo_name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "servey_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "customer_verifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.integer  "tab_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "verify_co_applicant_address_1"
    t.boolean  "verify_co_applicant_address_2"
    t.integer  "work_servey_id"
  end

  create_table "customers", :force => true do |t|
    t.string   "application_ref_no"
    t.string   "agency_name"
    t.string   "fh_code"
    t.string   "applicant_name"
    t.text     "address"
    t.string   "landmark"
    t.date     "d_o_b"
    t.integer  "pincode_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "slug"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "contact_number"
    t.string   "status"
    t.integer  "pin"
    t.string   "country_state"
    t.string   "country_city"
    t.string   "country_name"
    t.string   "snapshot"
    t.string   "application_status"
    t.boolean  "photo_required"
    t.string   "message"
    t.integer  "branch_id"
    t.integer  "client_id"
    t.integer  "branch_code"
    t.string   "area_name"
    t.integer  "city_id"
    t.boolean  "no_verifcation"
    t.string   "city_name"
    t.string   "pincode_number"
  end

  add_index "customers", ["address"], :name => "index_customers_on_address"
  add_index "customers", ["applicant_name"], :name => "index_customers_on_applicant_name"
  add_index "customers", ["application_ref_no"], :name => "index_customers_on_application_ref_no"

  create_table "customers_office_assets", :id => false, :force => true do |t|
    t.integer "customer_id"
    t.integer "office_asset_id"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "documents", :force => true do |t|
    t.integer  "customer_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "headshot_photos", :force => true do |t|
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.integer  "capturable_id"
    t.string   "capturable_type"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "office_assets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pincode_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pincodes", :force => true do |t|
    t.string   "name"
    t.integer  "pin_number"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "city"
    t.integer  "city_id"
    t.integer  "pincode_group_id"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.string   "slug"
    t.string   "contact_no_1"
    t.string   "contact_no_2"
    t.string   "blood_group"
    t.text     "address"
    t.date     "date_of_birth"
    t.string   "verification_area"
    t.text     "hobbies"
  end

  create_table "serveys", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "tab_id"
    t.boolean  "address_confirmed"
    t.boolean  "name_and_stay_confirm"
    t.date     "date_of_visit"
    t.time     "time_of_visit"
    t.string   "person_contacted"
    t.string   "relation_with_applicant"
    t.integer  "years_lived_at_current_address"
    t.string   "residence_status"
    t.string   "educational_qualification"
    t.string   "marital_status"
    t.integer  "no_of_family_members"
    t.integer  "working_member"
    t.integer  "children"
    t.boolean  "spouse_working"
    t.string   "spouse_working_detail"
    t.boolean  "name_plate_seen"
    t.boolean  "credit_card"
    t.string   "card_no"
    t.float    "card_limit"
    t.string   "issuing_bank"
    t.date     "expiry_date"
    t.string   "customer_beaviour"
    t.string   "neighbour_ref"
    t.string   "name_varified_from"
    t.string   "type_of_residence"
    t.string   "locality_of_residence"
    t.string   "ease_of_location"
    t.string   "construction_of_residence"
    t.string   "comments_of_exteriors"
    t.float    "carpet_area_in_sq_feet"
    t.string   "interior_condition"
    t.string   "asset_seen_at_residence"
    t.boolean  "potrait_on_wall"
    t.boolean  "applicant_residing_detail"
    t.string   "application_availibility_time"
    t.integer  "no_of_family_member_in_the_house"
    t.text     "verifiers_remark"
    t.boolean  "accept_or_decline"
    t.string   "refer_to_bank"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.date     "date_of_birth"
    t.string   "pancard_number"
    t.string   "passport_number"
    t.string   "driving_licence_number"
    t.string   "electricity_acc_number"
  end

  add_index "serveys", ["customer_id"], :name => "index_serveys_on_customer_id"
  add_index "serveys", ["date_of_visit"], :name => "index_serveys_on_date_of_visit"
  add_index "serveys", ["tab_id"], :name => "index_serveys_on_tab_id"

  create_table "tabs", :force => true do |t|
    t.string   "name"
    t.string   "tab_code"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "pin_code"
    t.string   "mac_address"
    t.integer  "pincode_id"
    t.integer  "pincode_group_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
    t.string   "name"
    t.integer  "tab_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "webcam_pictures", :force => true do |t|
    t.string   "name"
    t.string   "snapshot"
    t.integer  "customer_id"
    t.integer  "servey_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "work_servey_verifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "work_servey_id"
    t.integer  "tab_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "work_serveys", :force => true do |t|
    t.integer  "business_id"
    t.string   "office_address",                        :default => "N/A"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "name_and_employee_confirm"
    t.string   "applicant_designation",                 :default => "N/A"
    t.date     "date_of_visit"
    t.time     "time_of_visit"
    t.string   "person_met"
    t.string   "designation_of_person_met"
    t.string   "telephone_number"
    t.string   "ext_number"
    t.string   "mobile_number"
    t.integer  "number_of_years_in_present_employment"
    t.boolean  "visiting_card_obtained"
    t.string   "name_of_the_company"
    t.string   "type_of_business"
    t.string   "nature_of_business"
    t.string   "nob_in_detail"
    t.string   "office_ownership"
    t.string   "no_of_employees"
    t.string   "no_of_branches"
    t.float    "average_monthly_turn_over"
    t.integer  "no_of_customer_per_date"
    t.string   "type_of_job"
    t.string   "working_as"
    t.boolean  "job_transferable"
    t.float    "salary_drawn"
    t.float    "no_of_years_worked"
    t.boolean  "board_seen"
    t.string   "name_verified_from"
    t.string   "type_of_office"
    t.string   "locality_of_office"
    t.string   "construction_of_office"
    t.string   "exterior"
    t.string   "interior"
    t.float    "office_area"
    t.string   "ease_of_location"
    t.string   "activity_level"
    t.integer  "no_of_employees_sighted"
    t.integer  "no_of_customer_seen"
    t.boolean  "political_party"
    t.string   "no_of_item_seen"
    t.text     "verifier_remark"
    t.boolean  "positive"
    t.string   "refer_to_bank"
    t.integer  "user_id"
    t.integer  "verifier_signature"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.integer  "pincode_id"
    t.integer  "customer_id"
    t.string   "status"
    t.integer  "tab_id"
    t.string   "company_name_new"
    t.integer  "department_id"
    t.string   "new_department_name"
  end

end
