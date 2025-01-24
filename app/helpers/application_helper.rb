module ApplicationHelper

  def total_customer
   (Customer.all+Business.all+CoApplicant.all+CoApplicantBusiness.all).count
  end

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def residential
    Customer.where(status: 'RESIDENTIAL').last(50) + CoApplicant.where(status: 'RESIDENTIAL').last(50)
  end

  def business
    Business.where(status: 'BUSINESS').last(50) + CoApplicantBusiness.where(status: 'BUSINESS').last(50)
  end

  def pending_filter
    Customer.where(status: 'submitted') + CoApplicant.where(status: 'submitted') + Business.where(status: 'submitted') + CoApplicantBusiness.where(status: 'submitted')
  end

  def inqueue_filter
    Customer.where(status: 'ready_for_verification') + CoApplicant.where(status: 'ready_for_verification') + Business.where(status: 'ready_for_verification') + CoApplicantBusiness.where(status: 'ready_for_verification')
  end

  def in_progress_filter
    Customer.where(status: 'awaiting_to_get_verified') + CoApplicant.where(status: 'awaiting_to_get_verified') + Business.where(status: 'awaiting_to_get_verified') + CoApplicantBusiness.where(status: 'awaiting_to_get_verified')
  end

  def completed_filter
    Customer.where(status: 'verified') + CoApplicant.where(status: 'verified') + Business.where(status: 'verified') + CoApplicantBusiness.where(status: 'verified')
  end

  def complete_filter
    Customer.where(status: 'awaiting_to_get_verified') + CoApplicant.where(status: 'awaiting_to_get_verified') + Business.where(status: 'awaiting_to_get_verified') + CoApplicantBusiness.find_all_by_status('awaiting_to_get_verified')
  end

  def tab_pending
   CustomerVerification.select("customer_id").where("tab_id= ?", "#{current_user.tab_id}").order("created_at")
  end

  def pending_customer
    Customer.where(status: 'submitted')
  end

  def customer_in_progress
    Customer.where(status: 'awaiting_to_get_verified')
  end

  def completed_customer
    Customer.where(status: 'verified')
  end

  def pending_business
    Business.where(status: 'submitted')
  end

  def business_in_progress
    Business.where(status: 'awaiting_to_get_verified')
  end

  def completed_business
    Business.where(status: 'verified')
  end

  def pending_co_applicant
    CoApplicant.where(status: 'submitted')
  end

  def co_applicant_in_progress
    CoApplicant.where(status: 'awaiting_to_get_verified')
  end

  def completed_co_applicant
    CoApplicant.where(status: 'verified')
  end

  def pending_co_applicant_business
    CoApplicantBusiness.where(status: 'submitted')
  end

  def co_applicant_business_in_progress
    CoApplicantBusiness.where(status: 'awaiting_to_get_verified')
  end

  def co_applicant_business_completed
    CoApplicantBusiness.where(status: 'verified')
  end

  def total_pending
    pending_customer.count + pending_business.count + pending_co_applicant.count + pending_co_applicant_business.count
  end

  def total_in_progress
   customer_in_progress.count + business_in_progress.count + co_applicant_in_progress.count+ co_applicant_business_in_progress.count
  end

  def total_completed
   completed_customer.count + completed_business.count + completed_co_applicant.count + co_applicant_business_completed.count
  end

  def tab_customer_verification_pending
    CustomerVerification.joins(:customer, :tab).where('customers.status' => 'submitted', 'tabs.id' => current_user.tab).count
  end

  def tab_business_verification_pending
    BusinessVerification.joins(:business, :tab).where('businesses.status' => 'submitted', 'tabs.id' => current_user.tab).count
  end

  def tab_co_applicant_verification_pending
    CoApplicantVerification.joins(:co_applicant, :tab).where('co_applicants.status' => 'submitted', 'tabs.id' => current_user.tab).count
  end

  def tab_co_applicant_business_pending
    ClientVerification.joins(:co_applicant_business, :tab).where('co_applicant_businesses.status' => 'submitted', 'tabs.id' => current_user.tab).count
  end

  def pending_all_on_tab
    (tab_customer_verification_pending + tab_business_verification_pending + tab_co_applicant_verification_pending + tab_co_applicant_business_pending)
  end

  def tab_customer_verification_in_progress
    CustomerVerification.joins(:customer, :tab).where('customers.status' => 'awaiting_to_get_verified', 'tabs.id' => current_user.tab).count
  end

  def tab_business_verification_in_progress
    BusinessVerification.joins(:business, :tab).where('businesses.status' => 'awaiting_to_get_verified', 'tabs.id' => current_user.tab).count
  end

  def tab_co_applicant_verification_in_progress
    CoApplicantVerification.joins(:co_applicant, :tab).where('co_applicants.status' => 'awaiting_to_get_verified', 'tabs.id' => current_user.tab).count
  end

  def tab_co_applicant_business_in_progress
    ClientVerification.joins(:co_applicant_business, :tab).where('co_applicant_businesses.status' => 'awaiting_to_get_verified', 'tabs.id' => current_user.tab).count
  end

  def in_progress_all_on_tab
    (tab_customer_verification_in_progress + tab_business_verification_in_progress + tab_co_applicant_verification_in_progress + tab_co_applicant_business_in_progress)
  end

  def tab_customer_verification_completed
    CustomerVerification.joins(:customer, :tab).where('customers.status' => 'verified', 'tabs.id' => current_user.tab).count
  end

  def tab_business_verification_completed
    BusinessVerification.joins(:business, :tab).where('businesses.status' => 'verified', 'tabs.id' => current_user.tab).count
  end

  def tab_co_applicant_verification_completed
    CoApplicantVerification.joins(:co_applicant, :tab).where('co_applicants.status' => 'verified', 'tabs.id' => current_user.tab).count
  end

  def tab_co_applicant_business_completed
    ClientVerification.joins(:co_applicant_business, :tab).where('co_applicant_businesses.status' => 'verified', 'tabs.id' => current_user.tab).count
  end

  def completed_all_on_tab
    (tab_customer_verification_completed + tab_business_verification_completed + tab_co_applicant_verification_completed + tab_co_applicant_business_completed)
  end

end
