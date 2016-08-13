class ServeysController < ApplicationController
   before_filter :authenticate_user!
   load_and_authorize_resource

  def index

  end

  def new
   @customer = Customer.find(params[:customer_id])
   @survey = Servey.new
    @customer_documents = @survey.customer_documents.build
   #@webcam_picture = WebcamPicture.new
   #@webcam_pictures = WebcamPicture.find(:all)
  end

  def create
    @servey = Servey.new(params[:servey])

    respond_to do |format|
      if @servey.save
         @servey.customer.progress!
        format.html { redirect_to root_url, notice: 'Customer Servey successfully Done.' }
        format.json { render json: @servey, status: :created, location: @servey }
      else
        format.html { render action: "new" }
        format.json { render json: @servey.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
   @customer = Customer.find(params[:customer_id])
   @survey = Servey.find(params[:id])
   #@customer_documents = @survey.customer_documents.build
  end

  def update
    @survey = Servey.find(params[:id])

    respond_to do |format|
     if @survey.update_attributes(params[:servey])
        format.html { redirect_to @survey.customer, notice: 'successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end



end
