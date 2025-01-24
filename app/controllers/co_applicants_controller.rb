class CoApplicantsController < ApplicationController
   before_action :authenticate_user!
   layout 'print_layout', :only => :print_co_applicant
   load_and_authorize_resource

  def show
   @co_applicant = CoApplicant.find(params[:id])
   @co_applicant_work_detail = CoApplicantBusiness.new
   @application_ref_no = @co_applicant.application_ref_no

  end

  def new
   @servey = WorkServey.find(params[:customer_id])
   @co_applicant = CoApplicant.new
  end

  def edit
   @co_applicant = CoApplicant.find(params[:id])
   @final_no = @co_applicant.fh_code
   @application_ref_no = @co_applicant.application_ref_no
  end

 def assign_all
    params[:co_applicant_verification][:co_applicant_ids].each do |t|
     params_customer = {}
     params_customer['co_applicant_id'] = t
     @t = CoApplicantVerification.create(params_customer)
     @t.tab_id = params[:tab_id].to_i
     if @t.save
        @t.co_applicant.submit!
     end
    end
     redirect_to customers_cust_ready_path, notice: "successful."
 end

  def create
   @co_applicant = CoApplicant.create(params[:co_applicant])
   if @co_applicant.save
      area_name = Pincode.find_by_id(@co_applicant.pincode_id)
      @co_applicant.area_name = area_name.pin_number
      @co_applicant.save
    redirect_to @co_applicant.customer, :notice => "'#{@co_applicant.applicant_name}'s' Details Added."
   else
    redirect_to @co_applicant.customer, :notice => "Something went wrong , please contact the administrator!."
   end
 end

  def destroy
    @co_applicant = CoApplicant.find(params[:id])
    @co_applicant.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end


  def update
    @co_applicant = CoApplicant.find(params[:id])

    respond_to do |format|
     if @co_applicant.update_attributes(params[:co_applicant])
        #@customer.progress!
        format.html { redirect_to @co_applicant, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @co_applicant.errors, status: :unprocessable_entity }
      end
    end
  end



 def co_applicant_verification
   @co_applicant = CoApplicant.find(params[:co_applicant_id])
   @tab = Tab.find(:all)
   @verification = CoApplicantVerification.create(params[:co_applicant_verification])
    @verification.user_id = current_user.id
    @verification.co_applicant_id = @co_applicant.id

     if @verification.save
        @verification.co_applicant.submit!
        @user = User.find_by_role('super_user')
        #VerificationMailer.verification_confirmation(@user).deliver
        redirect_to @co_applicant, :notice =>"record has been send for verification"
    end
  end

  def accept
    @co_applicant = CoApplicant.find(params[:co_applicant_id])
    @co_applicant.accept!

    respond_to do |format|
       if @co_applicant.update_attributes(params[:customer])
         format.html { redirect_to root_url, notice: 'Status was successfully updated.' }
         format.json { head :ok }
       else
         format.html { render action: "edit" }
         format.json { render json: @customer.errors, status: :unprocessable_entity }
       end
     end
  end

  def re_indicated
    @co_applicant = CoApplicant.find(params[:co_applicant_id])
    @co_applicant.re_indicated!

    respond_to do |format|
       if @co_applicant.update_attributes(params[:customer])
         format.html { redirect_to root_url, notice: 'Status was successfully updated.' }
         format.json { head :ok }
       else
         format.html { render action: "edit" }
         format.json { render json: @customer.errors, status: :unprocessable_entity }
       end
     end
  end

  def print_co_applicant
    #@print_customer = CoApplicant.find(params[:customer_id])
  end


end
