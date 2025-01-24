class BusinessesController < InheritedResources::Base
   before_action :authenticate_user!
   layout 'print_layout', :only => :print_business_form
   load_and_authorize_resource

 def index
   @business = Business.all
    respond_to do |format|
      format.html # index.html.erb
			format.xlsx {
										 send_data Business.to_xlsx.to_stream.read,
										 :filename => 'Customers.xlsx',
										 :type => "application/vnd.openxmlformates-officedocument.spreadsheetml.sheet"
            			}
    end

 end

 def create
  @business = Business.create(params[:business])

   if @business.save
    redirect_to @business.customer, :notice => "Details Added."
   else
    redirect_to @business.customer, :alert => "you must have kept few empty fields or Something went wrong , please contact the administrator!."
 end
 end

 def show
  @business = Business.find(params[:id])
  @business_verification = BusinessVerification.new
 end

 def business_verification
   @business = Business.find(params[:business_id])
   @tab = Tab.find(:all)
   @verification = BusinessVerification.create(params[:business_verification])
    @verification.user_id = current_user.id
    @verification.business_id = @business.id

     if @verification.save
        @verification.business.submit!
        @user = User.find_by_role('super_user')
        #VerificationMailer.verification_confirmation(@user).deliver
        redirect_to @business, :notice =>"record has been send for verification"
    end
  end

 def assign_all
    params[:business_verification][:business_ids].each do |t|
     params_business = {}
     params_business['business_id'] = t
     @t = BusinessVerification.create(params_business)
     @t.tab_id = params[:tab_id].to_i
     if @t.save
        @t.business.submit!
     end
    end
     redirect_to customers_cust_ready_path, notice: "successful."
 end

  def accept
    @business = Business.find(params[:business_id])
    @business.accept!

    respond_to do |format|
       if @business.update_attributes(params[:business])
         format.html { redirect_to root_url, notice: 'Status was successfully updated.' }
         format.json { head :ok }
       else
         format.html { render action: "edit" }
         format.json { render json: @business.errors, status: :unprocessable_entity }
       end
     end
  end

  def edit
   @customer = Customer.find(params[:customer_id])
   @business = Business.find(params[:id])
   @application_ref_no = @customer.application_ref_no
  end


  def re_indicated
    @business = Business.find(params[:business_id])
    @business.re_indicated!

    respond_to do |format|
       if @business.update_attributes(params[:business])
         format.html { redirect_to root_url, notice: 'Status was successfully updated.' }
         format.json { head :ok }
       else
         format.html { render action: "edit" }
         format.json { render json: @business.errors, status: :unprocessable_entity }
       end
     end
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  def print_business_form
    @print_form = Business.find(params[:business_id])
  end


end
