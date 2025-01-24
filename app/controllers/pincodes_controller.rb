class PincodesController < ApplicationController
   before_action :authenticate_user!
   load_and_authorize_resource
  def index
   @pincodes = Pincode.order('name ASC')
  end

  def new
   @pincode = Pincode.new
  end

  def create
    @pincode = Pincode.create!(params[:pincode])
     if @pincode.save
       redirect_to pincodes_path, :notice => "Successfully added."
     end
  end

end
