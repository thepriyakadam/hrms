class ComplianceRecordsController < ApplicationController
  before_action :set_compliance_record, only: [:show, :edit, :update, :destroy]

  # GET /compliance_records
  # GET /compliance_records.json
  def index
    @compliance_records = ComplianceRecord.all
    @compliance_record = ComplianceRecord.new
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="complains"
  end

  # GET /compliance_records/1
  # GET /compliance_records/1.json
  def show
  end

  # GET /compliance_records/new
  def new
    @compliance_record = ComplianceRecord.new
  end

  # GET /compliance_records/1/edit
  def edit
  end

  # POST /compliance_records
  # POST /compliance_records.json
  def create
    @compliance_record = ComplianceRecord.new(compliance_record_params)
    if @compliance_record.save
      @compliance_record = ComplianceRecord.new
      @compliance_records = ComplianceRecord.all
      @flag = true
    else
      @flag = false
    end
  end

  # PATCH/PUT /compliance_records/1
  # PATCH/PUT /compliance_records/1.json
  def update
    if @compliance_record.update(compliance_record_params)
     @compliance_record = ComplianceRecord.new
     @compliance_records = ComplianceRecord.all
      @flag = true
    else
      @flag = false
    end
  end

  # DELETE /compliance_records/1
  # DELETE /compliance_records/1.json
  def destroy
    @compliance_record.destroy
    @compliance_records = ComplianceRecord.all
    redirect_to compliance_records_path 
  end

  def periodwise_record
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="complains"
  end

  def show_compliance_record
    from = params[:compliance_record][:from]
    to = params[:compliance_record][:to]
    agency_id = params[:compliance_record][:agency_id]
    agency = Agency.find_by(id: agency_id)
    if agency_id.nil? || agency_id == ""
      @compliance_records = ComplianceRecord.where(compliance_date: from.to_date..to.to_date)
    else
      @compliance_records = ComplianceRecord.where(compliance_date: from.to_date..to.to_date,agency_id: agency.id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compliance_record
      @compliance_record = ComplianceRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compliance_record_params
      params.require(:compliance_record).permit(:compliance_type_id, :agency_id, :compliance_date, :amount, :comment, :status)
    end
end
