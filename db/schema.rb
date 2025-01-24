# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2016_08_13_124659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "resource_id", limit: 255, null: false
    t.string "resource_type", limit: 255, null: false
    t.integer "author_id"
    t.string "author_type", limit: 255
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "namespace", limit: 255
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id"
  end

  create_table "address_proofs", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "address_proofs_customers", id: false, force: :cascade do |t|
    t.integer "address_proof_id"
    t.integer "customer_id"
  end

  create_table "address_proofs_serveys", id: false, force: :cascade do |t|
    t.integer "address_proof_id"
    t.integer "servey_id"
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", limit: 255
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "assets", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assets_customers", id: false, force: :cascade do |t|
    t.integer "asset_id"
    t.integer "customer_id"
  end

  create_table "assets_serveys", id: false, force: :cascade do |t|
    t.integer "asset_id"
    t.integer "servey_id"
  end

  create_table "attendences", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "login_time"
    t.datetime "logout_time"
    t.date "login_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "b_documents", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "b_documents_businesses", id: false, force: :cascade do |t|
    t.integer "business_id"
    t.integer "b_document_id"
  end

  create_table "branches", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "branch_code", limit: 255
    t.string "contact_person", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
  end

  create_table "business_documents", id: :serial, force: :cascade do |t|
    t.integer "business_id"
    t.integer "work_servey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name", limit: 255
    t.string "photo_content_type", limit: 255
    t.integer "photo_file_size"
  end

  create_table "business_verifications", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "customer_id"
    t.integer "business_id"
    t.integer "tab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "businesses", id: :serial, force: :cascade do |t|
    t.string "application_ref_no", limit: 255
    t.string "agency_name", limit: 255
    t.boolean "document_required"
    t.string "fh_code", limit: 255
    t.string "applicant_name", limit: 255
    t.string "application_status", limit: 255
    t.string "landmark", limit: 255
    t.text "address"
    t.string "country_name", limit: 255
    t.string "country_state", limit: 255
    t.string "country_city", limit: 255
    t.integer "pincode_id"
    t.string "slug", limit: 255
    t.float "latitude"
    t.float "longitude"
    t.string "status", limit: 255
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name", limit: 255
    t.string "pan_number", limit: 255
    t.string "emp_code", limit: 255
    t.integer "department_id"
    t.string "message", limit: 255
    t.integer "branch_id"
    t.integer "client_id"
    t.string "branch_code", limit: 255
    t.string "area_name", limit: 255
    t.integer "city_id"
    t.index ["applicant_name"], name: "index_businesses_on_applicant_name", unique: true
    t.index ["application_ref_no"], name: "index_businesses_on_application_ref_no", unique: true
    t.index ["customer_id"], name: "index_businesses_on_customer_id", unique: true
    t.index ["fh_code"], name: "index_businesses_on_fh_code", unique: true
    t.index ["status"], name: "index_businesses_on_status"
  end

  create_table "cities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_verifications", id: :serial, force: :cascade do |t|
    t.integer "co_applicant_business_id"
    t.integer "tab_id"
    t.integer "user_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "co_applicant_business_documents", id: :serial, force: :cascade do |t|
    t.integer "co_applicant_business_id"
    t.integer "co_applicant_work_detail_id"
    t.string "photo_file_name", limit: 255
    t.string "photo_content_type", limit: 255
    t.integer "photo_file_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "co_applicant_businesses", id: :serial, force: :cascade do |t|
    t.string "application_ref_no", limit: 255
    t.string "agency_name", limit: 255
    t.boolean "document_required"
    t.string "fh_code", limit: 255
    t.string "applicant_name", limit: 255
    t.string "application_status", limit: 255
    t.string "landmark", limit: 255
    t.text "address"
    t.string "country", limit: 255
    t.string "city", limit: 255
    t.string "state", limit: 255
    t.integer "pincode_id"
    t.string "slug", limit: 255
    t.float "latitude"
    t.float "longitude"
    t.string "status", limit: 255
    t.integer "customer_id"
    t.string "company_name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pan_number", limit: 255
    t.string "emp_code", limit: 255
    t.integer "department_id"
    t.string "message", limit: 255
    t.integer "branch_id"
    t.integer "client_id"
    t.string "branch_code", limit: 255
    t.string "area_name", limit: 255
    t.integer "city_id"
  end

  create_table "co_applicant_documents", id: :serial, force: :cascade do |t|
    t.integer "co_applicant_id"
    t.string "photo_file_name", limit: 255
    t.string "photo_content_type", limit: 255
    t.integer "photo_file_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "co_applicant_servey_id"
  end

  create_table "co_applicant_serveys", id: :serial, force: :cascade do |t|
    t.integer "co_applicant_id"
    t.integer "tab_id"
    t.boolean "address_confirmed"
    t.boolean "name_and_stay_confirm"
    t.date "date_of_visit"
    t.time "time_of_visit"
    t.string "person_contacted", limit: 255
    t.string "relation_with_applicant", limit: 255
    t.integer "years_lived_at_current_address"
    t.string "residence_status", limit: 255
    t.string "educational_qualification", limit: 255
    t.string "marital_status", limit: 255
    t.integer "no_of_family_members"
    t.integer "working_member"
    t.integer "children"
    t.boolean "spouse_working"
    t.string "spouse_working_detail", limit: 255
    t.boolean "name_plate_seen"
    t.boolean "credit_card"
    t.string "card_no", limit: 255
    t.float "card_limit"
    t.string "issuing_bank", limit: 255
    t.date "expiry_date"
    t.string "customer_beaviour", limit: 255
    t.string "neighbour_ref", limit: 255
    t.string "name_varified_from", limit: 255
    t.string "type_of_residence", limit: 255
    t.string "locality_of_residence", limit: 255
    t.string "ease_of_location", limit: 255
    t.string "construction_of_residence", limit: 255
    t.string "comments_of_exteriors", limit: 255
    t.float "carpet_area_in_sq_feet"
    t.string "interior_condition", limit: 255
    t.string "asset_seen_at_residence", limit: 255
    t.boolean "potrait_on_wall"
    t.boolean "applicant_residing_detail"
    t.string "application_availibility_time", limit: 255
    t.integer "no_of_family_member_in_the_house"
    t.text "verifiers_remark"
    t.boolean "accept_or_decline"
    t.string "refer_to_bank", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "photo_required"
    t.date "date_of_birth"
    t.string "pancard_number", limit: 255
    t.string "passport_number", limit: 255
    t.string "driving_licence_number", limit: 255
    t.string "electricity_acc_number", limit: 255
  end

  create_table "co_applicant_verifications", id: :serial, force: :cascade do |t|
    t.integer "co_applicant_id"
    t.integer "user_id"
    t.integer "customer_id"
    t.integer "tab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "co_applicant_work_details", id: :serial, force: :cascade do |t|
    t.integer "co_applicant_business_id"
    t.string "office_address", limit: 255, default: "N/A"
    t.float "latitude"
    t.float "longitude"
    t.boolean "name_and_employee_confirm"
    t.string "applicant_designation", limit: 255, default: "N/A"
    t.date "date_of_visit"
    t.time "time_of_visit"
    t.string "person_met", limit: 255
    t.string "designation_of_person_met", limit: 255
    t.string "telephone_number", limit: 255
    t.string "ext_number", limit: 255
    t.string "mobile_number", limit: 255
    t.integer "number_of_years_in_present_employment"
    t.boolean "visiting_card_obtained"
    t.string "name_of_the_company", limit: 255
    t.string "type_of_business", limit: 255
    t.string "nature_of_business", limit: 255
    t.string "nob_in_detail", limit: 255
    t.string "office_ownership", limit: 255
    t.string "no_of_employees", limit: 255
    t.string "no_of_branches", limit: 255
    t.float "average_monthly_turn_over"
    t.integer "no_of_customer_per_date"
    t.string "type_of_job", limit: 255
    t.string "working_as", limit: 255
    t.boolean "job_transferable"
    t.float "salary_drawn"
    t.float "no_of_years_worked"
    t.boolean "board_seen"
    t.string "name_verified_from", limit: 255
    t.string "type_of_office", limit: 255
    t.string "locality_of_office", limit: 255
    t.string "construction_of_office", limit: 255
    t.string "exterior", limit: 255
    t.string "interior", limit: 255
    t.float "office_area"
    t.string "ease_of_location", limit: 255
    t.string "activity_level", limit: 255
    t.integer "no_of_employees_sighted"
    t.integer "no_of_customer_seen"
    t.boolean "political_party"
    t.string "no_of_item_seen", limit: 255
    t.text "verifier_remark"
    t.boolean "positive"
    t.string "refer_to_bank", limit: 255
    t.integer "user_id"
    t.integer "verifier_signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "co_applicant_id"
    t.integer "pincode_id"
    t.integer "customer_id"
    t.string "status", limit: 255
    t.boolean "document_required"
    t.string "company_name", limit: 255
    t.string "landmark", limit: 255
    t.string "city", limit: 255
    t.string "state", limit: 255
    t.integer "application_ref_no"
    t.string "company_name_new", limit: 255
    t.integer "tab_id"
  end

  create_table "co_applicants", id: :serial, force: :cascade do |t|
    t.string "applicant_name", limit: 255
    t.string "agency_name", limit: 255
    t.boolean "document_required"
    t.string "fh_code", limit: 255
    t.string "landmark", limit: 255
    t.string "country_name", limit: 255
    t.string "country_state", limit: 255
    t.string "country_city", limit: 255
    t.string "slug", limit: 255
    t.string "status", limit: 255
    t.integer "customer_id"
    t.string "address", limit: 255
    t.float "latitude"
    t.float "longitude"
    t.string "application_status", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_number", limit: 255
    t.integer "application_ref_no"
    t.integer "pincode_id"
    t.string "state", limit: 255
    t.date "d_o_b"
    t.string "message", limit: 255
    t.integer "branch_id"
    t.integer "client_id"
    t.string "branch_code", limit: 255
    t.string "area_name", limit: 255
    t.integer "city_id"
  end

  create_table "customer_documents", id: :serial, force: :cascade do |t|
    t.integer "customer_id"
    t.string "photo", limit: 255
    t.string "photo_name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "servey_id"
    t.string "file_name"
  end

  create_table "customer_verifications", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "customer_id"
    t.integer "tab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "verify_co_applicant_address_1"
    t.boolean "verify_co_applicant_address_2"
    t.integer "work_servey_id"
  end

  create_table "customers", id: :serial, force: :cascade do |t|
    t.string "application_ref_no", limit: 255
    t.string "agency_name", limit: 255
    t.string "fh_code", limit: 255
    t.string "applicant_name", limit: 255
    t.text "address"
    t.string "landmark", limit: 255
    t.date "d_o_b"
    t.integer "pincode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.float "latitude"
    t.float "longitude"
    t.boolean "gmaps"
    t.string "contact_number", limit: 255
    t.string "status", limit: 255
    t.integer "pin"
    t.string "country_state", limit: 255
    t.string "country_city", limit: 255
    t.string "country_name", limit: 255
    t.string "snapshot", limit: 255
    t.string "application_status", limit: 255
    t.boolean "photo_required"
    t.string "message", limit: 255
    t.integer "branch_id"
    t.integer "client_id"
    t.integer "branch_code"
    t.string "area_name", limit: 255
    t.integer "city_id"
    t.boolean "no_verifcation"
    t.string "city_name"
    t.string "pincode_number"
    t.index ["address"], name: "index_customers_on_address"
    t.index ["applicant_name"], name: "index_customers_on_applicant_name"
    t.index ["application_ref_no"], name: "index_customers_on_application_ref_no"
  end

  create_table "customers_office_assets", id: false, force: :cascade do |t|
    t.integer "customer_id"
    t.integer "office_asset_id"
  end

  create_table "departments", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", id: :serial, force: :cascade do |t|
    t.integer "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "headshot_photos", id: :serial, force: :cascade do |t|
    t.string "description", limit: 255
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.integer "capturable_id"
    t.string "capturable_type", limit: 255
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_assets", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pincode_groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pincodes", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "pin_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city", limit: 255
    t.integer "city_id"
    t.integer "pincode_group_id"
  end

  create_table "profiles", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name", limit: 255
    t.string "photo_content_type", limit: 255
    t.integer "photo_file_size"
    t.string "slug", limit: 255
    t.string "contact_no_1", limit: 255
    t.string "contact_no_2", limit: 255
    t.string "blood_group", limit: 255
    t.text "address"
    t.date "date_of_birth"
    t.string "verification_area", limit: 255
    t.text "hobbies"
  end

  create_table "serveys", id: :serial, force: :cascade do |t|
    t.integer "customer_id"
    t.integer "tab_id"
    t.boolean "address_confirmed"
    t.boolean "name_and_stay_confirm"
    t.date "date_of_visit"
    t.time "time_of_visit"
    t.string "person_contacted", limit: 255
    t.string "relation_with_applicant", limit: 255
    t.integer "years_lived_at_current_address"
    t.string "residence_status", limit: 255
    t.string "educational_qualification", limit: 255
    t.string "marital_status", limit: 255
    t.integer "no_of_family_members"
    t.integer "working_member"
    t.integer "children"
    t.boolean "spouse_working"
    t.string "spouse_working_detail", limit: 255
    t.boolean "name_plate_seen"
    t.boolean "credit_card"
    t.string "card_no", limit: 255
    t.float "card_limit"
    t.string "issuing_bank", limit: 255
    t.date "expiry_date"
    t.string "customer_beaviour", limit: 255
    t.string "neighbour_ref", limit: 255
    t.string "name_varified_from", limit: 255
    t.string "type_of_residence", limit: 255
    t.string "locality_of_residence", limit: 255
    t.string "ease_of_location", limit: 255
    t.string "construction_of_residence", limit: 255
    t.string "comments_of_exteriors", limit: 255
    t.float "carpet_area_in_sq_feet"
    t.string "interior_condition", limit: 255
    t.string "asset_seen_at_residence", limit: 255
    t.boolean "potrait_on_wall"
    t.boolean "applicant_residing_detail"
    t.string "application_availibility_time", limit: 255
    t.integer "no_of_family_member_in_the_house"
    t.text "verifiers_remark"
    t.boolean "accept_or_decline"
    t.string "refer_to_bank", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_of_birth"
    t.string "pancard_number", limit: 255
    t.string "passport_number", limit: 255
    t.string "driving_licence_number", limit: 255
    t.string "electricity_acc_number", limit: 255
    t.index ["customer_id"], name: "index_serveys_on_customer_id"
    t.index ["date_of_visit"], name: "index_serveys_on_date_of_visit"
    t.index ["tab_id"], name: "index_serveys_on_tab_id"
  end

  create_table "tabs", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "tab_code", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pin_code", limit: 255
    t.string "mac_address", limit: 255
    t.integer "pincode_id"
    t.integer "pincode_group_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", limit: 255
    t.string "name", limit: 255
    t.integer "tab_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "webcam_pictures", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "snapshot", limit: 255
    t.integer "customer_id"
    t.integer "servey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_servey_verifications", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "work_servey_id"
    t.integer "tab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_serveys", id: :serial, force: :cascade do |t|
    t.integer "business_id"
    t.string "office_address", limit: 255, default: "N/A"
    t.float "latitude"
    t.float "longitude"
    t.boolean "name_and_employee_confirm"
    t.string "applicant_designation", limit: 255, default: "N/A"
    t.date "date_of_visit"
    t.time "time_of_visit"
    t.string "person_met", limit: 255
    t.string "designation_of_person_met", limit: 255
    t.string "telephone_number", limit: 255
    t.string "ext_number", limit: 255
    t.string "mobile_number", limit: 255
    t.integer "number_of_years_in_present_employment"
    t.boolean "visiting_card_obtained"
    t.string "name_of_the_company", limit: 255
    t.string "type_of_business", limit: 255
    t.string "nature_of_business", limit: 255
    t.string "nob_in_detail", limit: 255
    t.string "office_ownership", limit: 255
    t.string "no_of_employees", limit: 255
    t.string "no_of_branches", limit: 255
    t.float "average_monthly_turn_over"
    t.integer "no_of_customer_per_date"
    t.string "type_of_job", limit: 255
    t.string "working_as", limit: 255
    t.boolean "job_transferable"
    t.float "salary_drawn"
    t.float "no_of_years_worked"
    t.boolean "board_seen"
    t.string "name_verified_from", limit: 255
    t.string "type_of_office", limit: 255
    t.string "locality_of_office", limit: 255
    t.string "construction_of_office", limit: 255
    t.string "exterior", limit: 255
    t.string "interior", limit: 255
    t.float "office_area"
    t.string "ease_of_location", limit: 255
    t.string "activity_level", limit: 255
    t.integer "no_of_employees_sighted"
    t.integer "no_of_customer_seen"
    t.boolean "political_party"
    t.string "no_of_item_seen", limit: 255
    t.text "verifier_remark"
    t.boolean "positive"
    t.string "refer_to_bank", limit: 255
    t.integer "user_id"
    t.integer "verifier_signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pincode_id"
    t.integer "customer_id"
    t.string "status", limit: 255
    t.integer "tab_id"
    t.string "company_name_new", limit: 255
    t.integer "department_id"
    t.string "new_department_name"
  end

end
