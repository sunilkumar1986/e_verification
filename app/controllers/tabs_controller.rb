class TabsController < ApplicationController
  before_action :authenticate_user!
  include ApplicationHelper
  include TabsHelper
  include DashboardsHelper
  # load_and_authorize_resource

  def index
    @tabs = Tab.all
  end

  def show
    @tab = Tab.find(params[:id])
    @tab_data_customer = CustomerVerification.where(tab_id: @tab)
    @tab_data_client = ClientVerification.where(tab_id: @tab)
    @tab_data_coapp = CoApplicantVerification.where(tab_id: @tab)
    @tab_data_business = BusinessVerification.where(tab_id: @tab)
  end

  def new
    @tab = Tab.new
  end

  def create
    @tab = Tab.new(params[:tab])
    @tab.mac_address = Mac.addr
    if @tab.save
      redirect_to @tab, :notice => "Successfully created tab."
    else
      render :action => 'new'
    end
  end

  def edit
    @tab = Tab.find(params[:id])
  end

  def update
    @tab = Tab.find(params[:id])
    @tab.mac_address = Mac.addr
    if @tab.update_attributes(params[:tab])
      redirect_to @tab, :notice  => "Successfully updated tab."
    else
      render :action => 'edit'
    end
  end

  def tab_status
    @tab_id = Tab.find(params[:tab_id])
    @customer_v = CustomerVerification.find_all_by_tab_id(@tab_id)
    @business_v = BusinessVerification.find_all_by_tab_id(@tab_id)
    @co_applicant_v = CoApplicantVerification.find_all_by_tab_id(@tab_id)
    @co_applicant__business_v = ClientVerification.find_all_by_tab_id(@tab_id)
    @data =  @customer_v+@business_v+@co_applicant_v+@co_applicant__business_v
  end

  def destroy
    @tab = Tab.find(params[:id])
    @tab.destroy
    redirect_to tabs_url, :notice => "Successfully destroyed tab."
  end
end
