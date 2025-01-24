class CoApplicantBusinessesController < ApplicationController
   before_action :authenticate_user!
   layout 'print_layout', :only => :print_co_applicant_business
   load_and_authorize_resource

 def create
  @co_applicant = CoApplicantBusiness.create(params[:co_applicant_business])
   if @co_applicant.save
    redirect_to customer_path(@co_applicant.customer), :notice => "'#{@co_applicant.applicant_name}'s business Details Added."
   else
    redirect_to @co_applicant.customer, :notice => "Something went wrong , please contact the administrator!."
 end
 end

 def assign_all
    params[:co_applicant_business_verification][:co_applicant_business_ids].each do |t|
     params_customer = {}
     params_customer['co_applicant_business_id'] = t
     @t = ClientVerification.create(params_customer)
     @t.tab_id = params[:tab_id].to_i
     if @t.save
        @t.co_applicant_business.submit!
     end
    end
     redirect_to customers_cust_ready_path, notice: "successful."
 end


 def edit
  @co_applicant = CoApplicant.find(params[:co_applicant_id])
  @co_applicant_work_detail = CoApplicantBusiness.find(params[:id])
  @application_ref_no = @co_applicant.application_ref_no
 end

  def update
    @co_applicant_business = CoApplicantBusiness.find(params[:id])

    respond_to do |format|
     if @co_applicant_business.update_attributes(params[:co_applicant_business])
        format.html { redirect_to @co_applicant_business, notice: 'successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @co_applicant_business.errors, status: :unprocessable_entity }
      end
    end
  end

 def show
  @co_applicant_business = CoApplicantBusiness.find(params[:id])
 end

  def destroy
    @co_applicant_business = CoApplicantBusiness.find(params[:id])
    @co_applicant_business.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end



 def business_verification
   @co_applicant = CoApplicantBusiness.find(params[:business_id])
   @tab = Tab.find(:all)
   @verification = ClientVerification.create(params[:client_verification])
    @verification.user_id = current_user.id
    @verification.co_applicant_business_id = @co_applicant.id
     if @verification.save
        @verification.co_applicant_business.submit!
        @user = User.find_by_role('super_user')
        #VerificationMailer.verification_confirmation(@user).deliver
        redirect_to @co_applicant, :notice =>"record has been send for verification"
    end
  end

  def accept
    @co_applicant_business = CoApplicantBusiness.find(params[:co_applicant_business_id])
    @co_applicant_business.accept!

    respond_to do |format|
       if @co_applicant_business.update_attributes(params[:co_applicant_business])
         format.html { redirect_to root_url, notice: 'Status was successfully updated.' }
         format.json { head :ok }
       else
         format.html { render action: "edit" }
         format.json { render json: @co_applicant_business.errors, status: :unprocessable_entity }
       end
     end
  end

  def re_indicated
   @co_applicant_business = CoApplicantBusiness.find(params[:co_applicant_business_id])
    @business.re_indicated!

    respond_to do |format|
       if @co_applicant_business.update_attributes(params[:co_applicant_business])
         format.html { redirect_to root_url, notice: 'Status was successfully updated.' }
         format.json { head :ok }
       else
         format.html { render action: "edit" }
         format.json { render json: @co_applicant_business.errors, status: :unprocessable_entity }
       end
     end
  end


 def print_co_applicant_business
  #@print_co_applicant_business = CoApplicantBusiness.find(params[:business_id])
 end

end
