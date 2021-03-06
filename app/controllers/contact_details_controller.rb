class ContactDetailsController < ApplicationController
  before_action :set_contact_detail, only: [:show, :edit, :update, :destroy]

  # GET /contact_details
  # GET /contact_details.json
  def index
    @contact_details = ContactDetail.where(status: true)
    session[:active_tab] ="EmployeeSelfService"
  end

  # GET /contact_details/1
  # GET /contact_details/1.json
  def show
  end

  # GET /contact_details/new
  def new
    @contact_detail = ContactDetail.new
    @contact_details = ContactDetail.all
    session[:active_tab] = "InformationManagement"
    session[:active_tab1] = "Events" 
  end

  # GET /contact_details/1/edit
  def edit
  end

  # POST /contact_details
  # POST /contact_details.json
  def create
    @contact_detail = ContactDetail.new(contact_detail_params)
    @contact_details = ContactDetail.all
    respond_to do |format|
      if @contact_detail.save
         @contact_detail = ContactDetail.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'About Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /contact_details/1
  # PATCH/PUT /contact_details/1.json
  def update
     @contact_detail.update(contact_detail_params)
     @contact_details = ContactDetail.all
     @contact_detail = ContactDetail.new  
  end

  # DELETE /contact_details/1
  # DELETE /contact_details/1.json
  def destroy
    @contact_detail.destroy
    @contact_details = ContactDetail.all
  end

  def modal_contact_detail
    @contact_detail = ContactDetail.find(params[:format])
  end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_contact_details_path
      else
     ContactDetail.import(params[:file])
     redirect_to new_contact_detail_path, notice: "File imported."
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_detail
      @contact_detail = ContactDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_detail_params
      params.require(:contact_detail).permit(:employee_id, :name, :description, :status,:role1,:role2,:role3,:role4,:role5,:role6,:role7,:role8)
    end
end
