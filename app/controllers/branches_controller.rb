class BranchesController < ApplicationController
   before_action :authenticate_user!
   # load_and_authorize_resource

  def index
   @branches = Branch.all
  end

  def new
   @branch = Branch.new
  end

  def create
   @branch = Branch.create(params[:branch])
   if @branch.save
    redirect_to new_customer_path, :notice => "branch saved Successfully."
   end
  end

  def get_branch_code
   branch = Branch.order("name ASC").find(params[:id])
   render :text => branch.branch_code
  end

  def get_area_name
   area = Pincode.order("name ASC").find(params[:id])
  render :text => area.pin_number
  end

  def get_area
   @city_area = Pincode.order("name ASC").where(city_id: params[:id])
   #render :text =>
  end

end
